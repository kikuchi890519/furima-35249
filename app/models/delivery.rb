class Delivery < ApplicationRecord
  belongs_to :purchase_record

    # バリデーションの処理を書く
    # with_options presence: true do
    #   validates :municipality
    #   validates :address
    #   validates :phone_number, format: {with: /\A\d{11}\z/, message: "Phone number can't be blank"}
    #   validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    # end
  
    # validates :city_id, numericality: { other_than: 0, message: 'Select' } do
    # end

end
