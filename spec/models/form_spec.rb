require 'rails_helper'
RSpec.describe Form, type: :model do
  before do
    user = FactoryBot.create(:user)
    # FactoryBotからuserをcreate
    item = FactoryBot.create(:item)
    # FactoryBotからitemをcreate
    # 理由は購入するためには出品者、商品が必要であり、購入のテストができない
    @form = FactoryBot.build(:form, user_id: user.id, item_id: item.id)
  end

    describe '商品購入' do
      context '内容に問題ない場合' do
        it "すべての情報があれば登録ができること" do
          expect(@form).to be_valid
        end
      end

      context '内容に問題ある場合' do
        it "tokenが空では登録できないこと" do
          @form.token = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Token can't be blank")
        end

        it "郵便番号が空では保存ができないこと" do
          @form.post_code = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Post code can't be blank")
        end
    
        it "郵便番号の入力にハイフンが不足していること" do
          @form.post_code = 1850022
          @form.valid?
          expect(@form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
    
        it "都道府県が空では保存ができないこと" do
          @form.city_id = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("City Select")
        end

        it '都道府県についての情報が未選択では登録できない' do
          @form.city_id = 0
          @form.valid?
          expect(@form.errors.full_messages).to include('City Select')
        end
    
        it "市区町村が空では保存ができないこと" do
          @form.municipality = ""
          @form.valid?
          expect(@form.errors.full_messages).to include("Municipality can't be blank")
        end
    
        it "番地が空では保存ができないこと" do
          @form.address = ""
          @form.valid?
          expect(@form.errors.full_messages).to include("Address can't be blank")
        end
    
        it "電話番号が空では保存ができないこと" do
          @form.phone_number = ""
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number can't be blank")
        end
    
        it "電話番号は12桁以上では保存ができないこと" do
          @form.phone_number = "090000000000"
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number can't be blank")
        end
    
        it "電話番号が全角では保存ができないこと" do
          @form.phone_number = "あああああああああああ"
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number can't be blank")
        end
    
        it "電話番号がカタカナでは保存ができないこと" do
          @form.phone_number = "アアアアアアアアアアア"
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number can't be blank")
        end

        it "電話番号が英語では保存ができないこと" do
          @form.phone_number = "kkkkkkkkkkk"
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number can't be blank")
        end

        it "user_idが空では保存ができないこと" do
          @form.user_id = ""
          @form.valid?
          expect(@form.errors.full_messages).to include("User can't be blank")
        end

        it "item_idが空では保存ができないこと" do
          @form.item_id = ""
          @form.valid?
          expect(@form.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
end