class Item < ApplicationRecord
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  belongs_to :user
  has_one_attached :image
    # has_one    :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :city
  belongs_to :days_ship

  with_options presence: true do
    validates :image
    validates :name
    validates :details
    validates :price
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :city_id
    validates :days_ship_id
  end

  validates :price, 
  numericality: { greater_than_or_equal_to: 300, less_than: 9999999,}

  with_options format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' } do
    validates :price
  end

  # ジャンルの選択が「---」（idが0）の時は保存できないようにする
  with_options numericality: { other_than: 0, message: 'Select'} do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :city_id
    validates :days_ship_id
  end
end
