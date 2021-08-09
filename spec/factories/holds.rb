FactoryBot.define do
  factory :hold do
    association :post
    association :channel
  end
end