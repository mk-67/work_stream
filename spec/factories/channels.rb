FactoryBot.define do
  factory :channel do
    channel {Faker::Team.name}
  end
end