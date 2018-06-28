# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :issue

  validates_presence_of :action
  validates_inclusion_of :action, in: %w[opened closed reopened]

  scope :opened, -> { where(action: 'opened') }
  scope :closed, -> { where(action: 'closed') }
  scope :reopened, -> { where(action: 'reopened') }
end
