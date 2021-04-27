class Form 
  # ActiveModel::Modelを呼び出して、form_withメソッドに対応する機能とバリデーションを行う機能を持たせる
  include ActiveModel::Model

  # 保存したいカラム名（purchase_record,delivery）を全て記述する
  attr_accessor :token, :user_id, :item_id, :post_code, :city_id, :municipality, :address, :building_name, :phone_number
  # purchase_recordはコントローラーから情報は取得していないので記述しない

  # バリデーションの処理を書く
  # -----ここから----------------

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    # （user_id,item_id）フォームオブジェクトでは
    # 直接アソシエーションを組んでいないためバリデーションが必要

    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{1,11}\z/, message: "can't be blank"}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  validates :city_id, numericality: { other_than: 0, message: 'Select' } do
  end

  # -----ここまで----------------

  # 各テーブルにデータを保存する処理を書く
  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    # cretae 左（カラム名）、右（コントローラーでストロングパラメーターに記載した情報）
    # purchase_recordは26行目で定義
    Delivery.create(post_code: post_code, city_id: city_id, municipality: municipality, address: address, building_name: building_name, phone_number:phone_number, purchase_record_id: purchase_record.id)
  end

end