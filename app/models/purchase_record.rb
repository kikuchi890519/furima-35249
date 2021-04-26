class PurchaseRecord < ApplicationRecord

  belongs_to :user # usersテーブルとのアソシエーション
  belongs_to :item # itemsテーブルとのアソシエーション
  has_one :delivery # deliveriesテーブルとのアソシエーション

  # attr_accessor :token
  # validates :price, presence: true
  # validates :token, presence: true
  # 本来はテーブルに存在しないため、"token"はバリデーション記載できない

end