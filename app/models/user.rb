class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_records

  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :first_name
    validates :birth_date
  end

  validates :email, uniqueness: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '6文字以上半角英数字を含めて設定してください' 
  validates :password, length: { minimum: 6 }

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角（漢字・ひらがな・カタカナ）で入力してください' } do
    validates :family_name
    validates :first_name
  end

  with_options format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナを入力して下さい' } do
    validates :family_name_kana
    validates :first_name_kana 
  end

end