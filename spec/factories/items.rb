FactoryBot.define do
  factory :item do
    name                { Faker::Lorem.word }
    explanation         { Faker::Lorem.sentence }
    category_id         { Faker::Number.within(range: 2..11) }
    status_id           { Faker::Number.within(range: 2..7) }
    delivery_charge_id  { Faker::Number.within(range: 2..3) }
    area_id             { Faker::Number.within(range: 2..48) }
    date_of_shipping_id { Faker::Number.within(range: 2..4) }
    price               { Faker::Number.within(range: 333..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
