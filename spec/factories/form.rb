FactoryBot.define do
  factory :form do
    token { "tok_abcdefghijk00000000000000000" }
    # 【メモ書き】
    # formオブジェクトにはアソシエーションは使えない

    post_code            { "185-0022" }
    city_id              { 1 }
    municipality         { '国分寺市' }
    address              { '東元町1-1-1' }
    building_name        { '国分寺ハイツ' }
    phone_number         { "09012341234" }
  end
end
