FactoryBot.define do
  factory :issue do
    number { rand(100) }
    title 'Issue test'
    body 'This is the body'
  end
end
