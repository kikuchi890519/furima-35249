require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    # 【メモ書き】
    # アソシエーションがない場合の記述（@itemの記述に出品者情報であるuser_idなどが必要）
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品登録ができるとき' do
      it 'すべての情報があれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品登録ができないとき' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明についての情報が空では登録できない' do
        @item.details = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Details can't be blank")
      end

      it 'カテゴリーについての情報が空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーについての情報が未選択では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it '商品の状態についての情報が空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '商品の状態についての情報が未選択では登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it '配送料の負担についての情報が空では登録できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it '配送料の負担についての情報が未選択では登録できない' do
        @item.shipping_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge Select')
      end

      it '発送元の地域についての情報が空では登録できない' do
        @item.city_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("City can't be blank")
      end

      it '発送元の地域についての情報が未選択では登録できない' do
        @item.city_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('City Select')
      end

      it '発送までの日数についての情報が空では登録できない' do
        @item.days_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days ship can't be blank")
      end

      it '発送までの日数についての情報が未選択では登録できない' do
        @item.days_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Days ship Select')
      end

      it '販売価格についての情報が未入力では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は¥300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格は¥10000000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end

      it '販売価格は半角数字以外では登録できない' do
        @item.price = 'あああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 半角数字で入力してください')
      end
    end
  end
end
# RSpec.describe Item, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
