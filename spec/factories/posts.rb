FactoryBot.define do
  factory :post do
    content {Faker::Lorem.sentence}
    association :user
    association :channel

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end