FactoryBot.define do
  factory :like do
    association :user
    association :post
    association :channel
  end
end