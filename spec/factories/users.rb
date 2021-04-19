FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a'+ Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    family_name           { '鈴木' }
    family_name_kana      { 'スズキ' }
    first_name            { '太郎' }
    first_name_kana       { 'タロウ' }
    birth_date            { '1995-01-01' }
  end
end
