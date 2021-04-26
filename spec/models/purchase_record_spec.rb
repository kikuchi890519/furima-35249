# require 'rails_helper'
# RSpec.describe PurchaseRecord, type: :model do
#   before do
#     @purchase_record = FactoryBot.build(:purchase_record)
#   end

#     describe '商品購入' do
#     context '内容に問題ない場合' do
#       it "すべての情報があれば登録ができること" do
#         expect(@purchase_record).to be_valid
#       end
#     end

#     context '内容に問題ある場合' do
#       it "tokenが空では登録できないこと" do
#         @purchase_record.token = nil
#         @purchase_record.valid?
#         expect(@purchase_record.errors.full_messages).to include("Token can't be blank")
#         end
#       end
#    end
# end