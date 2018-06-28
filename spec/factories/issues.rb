# frozen_string_literal: true

FactoryBot.define do
  factory :issue do
    number { rand(100) }
    state { %w[opened closed reopened].sample }
    title 'Issue test'
    body 'This is the body'
    url 'http://www.pudim.com.br'
  end
end
