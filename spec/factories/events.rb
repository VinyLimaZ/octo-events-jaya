# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    action %w[opened closed reopened].sample

    association :issue
  end
end
