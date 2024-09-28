FactoryBot.define do
  factory :item do
    association :user

    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence(word_count: 15) }
    category_id { rand(1..10) }
    condition_id { rand(1..5) }
    shipping_charge_id { rand(1..5) }
    prefecture_id { rand(1..47) }
    shipping_day_id { rand(1..5) }
    price { rand(300..10_000) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    trait :invalid do
      name { nil }
    end

    trait :low_price do
      price { 299 }
    end
  end
end
