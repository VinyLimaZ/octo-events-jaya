# frozen_string_literal: true

require 'factory_bot_rails'

(100..200).each do |number|
  FactoryBot.create(
    :issue,
    number: number,
    state: %w[opened closed reopened].sample
  )
end

1000.times do
  FactoryBot.create(
    :event,
    issue: Issue.find_by_number((100..200).to_a.sample),
    action: %w[opened closed reopened].sample
  )
end
