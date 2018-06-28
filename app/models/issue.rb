# frozen_string_literal: true

class Issue < ApplicationRecord
  has_many :events

  validates_presence_of :number, :title, :url, :state
  validates_inclusion_of :state, in: %w[open opened closed reopen reopened]
  validates_uniqueness_of :number

  def self.find_or_create_by(params)
    find_by_number_and_return(params) || create(params)
  end

  def self.find_by_number_and_return(params)
    issue = find_by_number(params[:number])
    if issue.present?
      issue.tap { |i| i.update(params) }
    else
      false
    end
  end
end
