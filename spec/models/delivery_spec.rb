# require 'rails_helper'
# RSpec.describe PurchaseRecord, type: :model do
#   before do
#     @delivery = FactoryBot.build(:delivery)
#   end

#   describe '商品購入' do
#   context '内容に問題ない場合' do
#     it "すべての情報があれば保存ができること" do
#       expect(@delivery).to be_valid
#     end
#   end

#   context '内容に問題がある場合' do
#     it "郵便番号が空では保存ができないこと" do
#       @delivery.post_code = nil
#       @delivery.valid?
#       expect(@delivery.errors.full_messages).to include("Post code can't be blank")
#     end

#     it "郵便番号の入力にハイフンが不足していること" do
#       @delivery.post_code = nil
#       @delivery.valid?
#       expect(@delivery.errors.full_messages).to include("Post code can't be blank")
#     end

#     it "都道府県が空では保存ができないこと" do
#       @delivery.city = nil
#       @delivery.valid?
#       expect(@delivery.errors.full_messages).to include("City can't be blank")
#     end

#     it "市区町村が空では保存ができないこと" do
#       @delivery.municipality = ""
#       @delivery.valid?
#       expect(@delivery.errors.full_messages).to include("Municipality can't be blank")
#     end

#       it "番地が空では保存ができないこと" do
#         @delivery.address = ""
#         @delivery.valid?
#         expect(@delivery.errors.full_messages).to include("Municipality can't be blank")
#       end

#     it "電話番号が空では保存ができないこと" do
#       @delivery.phone_number = ""
#       @delivery.valid?
#       expect(@delivery.errors.full_messages).to include("Phone number can't be blank")
#     end

#     it "電話番号は12桁以内以上では保存ができないこと" do
#       @delivery.phone_number = 090000000000
#       @delivery.valid?
#       expect(@delivery.errors.full_messages).to include("Phone number can't be blank")
#     end

#     it "電話番号が全角では保存ができないこと" do
#       @delivery.phone_number = "あああああああああああ"
#       @delivery.valid?
#       expect(@delivery.errors.full_messages).to include("Phone number can't be blank")
#     end

#       it "電話番号がカタカタでは保存ができないこと" do
#         @delivery.phone_number = "アアアアアアアアアアア"
#         @delivery.valid?
#         expect(@delivery.errors.full_messages).to include("Phone number can't be blank")
#       end

#         it "電話番号が英語では保存ができないこと" do
#           @delivery.phone_number = "kkkkkkkkkkk"
#           @delivery.valid?
#           expect(@delivery.errors.full_messages).to include("Phone number can't be blank")
#         end
#       end
#     end
