FactoryBot.define do
  factory :item do
    name               { '時計' }
    details            { '2021年購入ロレックスの時計です。' }
    price              { 500000 }
    category_id        { 1 }
    condition_id       { 1 }
    shipping_charge_id { 1 }
    city_id            { 1 }
    days_ship_id       { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/nikomame.jpeg'), filename: 'nikomame.jpeg')
    end
  end
end
