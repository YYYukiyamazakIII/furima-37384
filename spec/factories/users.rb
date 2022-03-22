FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number:6..128 , min_alpha:1, min_numeric:1)}
    password_confirmation {password}
    last_name = Faker::Japanese::Name.last_name
    first_name = Faker::Japanese::Name.first_name
    last_name             {last_name}
    first_name            {first_name}
    last_name_kana        {last_name.yomi}
    first_name_kana       {first_name.yomi}
    date_of_birth         {'1930-01-01'}
  end
end
