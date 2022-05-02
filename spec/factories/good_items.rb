FactoryBot.define do
  factory :good_item do
    association :user
    association :item
  end
end
