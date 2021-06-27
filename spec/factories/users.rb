FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {'aaaa1111'}
    password_confirmation {password}
    first_name {'菅田'}
    last_name {'将暉'}
    first_name_hurigana { Gimei.first.katakana }
    last_name_hurigana { Gimei.last.katakana }
    birthday {Faker::Date.birthday}

  end
end