FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '111aaa' }
    password_confirmation { password }
    first_name            { '名前' }
    last_name             { '名字' }
    first_name_kana       { 'フリガナ' }
    last_name_kana        { 'フリガナ' }
    birth_day             { '2021-01-21' }
  end
end
