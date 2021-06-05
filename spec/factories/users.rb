FactoryBot.define do

  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    first_name_hurigana { Gimei.first.katakana }
    last_name_hurigana { Gimei.last.katakana }
    birthday {Faker::Date.birthday}
  end
end