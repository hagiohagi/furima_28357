FactoryBot.define do
  factory :item do
    association :user

    name { Faker::Name.initials(number: 2) }
    price { 1000 }
    text { 'モンゴル人' }
    user_id { @user }
    genre_id { 1 }
    quality_id { 1 }
    payment_id { 1 }
    prefecture_id { 1 }
    days_id { 1 }
  end
end
