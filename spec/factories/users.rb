FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length:6)}
    password_confirmation {password}
    firstname_kanji       {"漢字"}
    lastname_kanji        {"漢字"}
    firstname_katakana    {"カタカナ"}
    lastname_katakana     {"カタカナ"}
    birth_day             {Faker::Date.birthday}
  end
end