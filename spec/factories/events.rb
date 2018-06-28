FactoryBot.define do
  factory :event do
    action %w[open closed reopen].sample

    association :issue
  end
end
