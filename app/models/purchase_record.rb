class PurchaseRecord < ApplicationRecord
  belongs_to :user # usersテーブルとのアソシエーション
  belongs_to :item # itemsテーブルとのアソシエーション
  has_one :delivery # deliveriesテーブルとのアソシエーション
end