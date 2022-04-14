FactoryBot.define do
  factory :purchased_item_shipping_address do
    zip_code = Faker::Number.number(digits: 7)
    zip_code       { zip_code.to_s.insert(3, '-') }
    area_id        { Faker::Number.within(range: 2..48) }
    municipalities { Faker::Address.city }
    street_number  { Faker::Address.street_address }
    building_name  { Faker::Address.building_number }
    phone_number   { Faker::Number.within(range: 1_000_000_000..99_999_999_999) }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
