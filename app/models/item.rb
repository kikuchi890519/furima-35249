class Item < ApplicationRecord
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  belongs_to :user
  has_one    :purchase_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :image
    validates :name
    validates :details
    validates :price
  end

  validates :price, numericality: { in: 300..9999999, message: 'Price Out of setting range' }

  with_options format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' } do
    validates :price
  end

  # ジャンルの選択が「---」（idが0）の時は保存できないようにする
  validates :category_id, numericality: { other_than: 0, message: 'Select'}
end
