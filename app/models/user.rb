class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_records

  validates :nickname, presence: true
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :family_name, presence: true
  
  with_options presence: true, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナを入力して下さい' } do
    validates :first_name_kana
    validates :family_name_kana
  end

  validates :birth_date, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください' 
  validates :password, length: { minimum: 6 }
  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{6,100}+\z/
  # validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
end