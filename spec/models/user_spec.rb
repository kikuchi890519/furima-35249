require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'すべての情報があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
 
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailには@がなければ登録できない" do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが6文字以上でなければ登録できない" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it "passwordは半角数字でのみでは登録できない" do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors[:password]).to include("6文字以上半角英数字を含めて設定してください")
      end

      it "passwordは半角英字のみでは登録できない" do
        @user.password = 'kkkkkk'
        @user.password_confirmation = 'kkkkkk'
        @user.valid?
        expect(@user.errors[:password]).to include("6文字以上半角英数字を含めて設定してください")
      end

      it "passwordは全角英数字のみでは登録できない" do
        @user.password = 'ｋｋｋ１１１'
        @user.password_confirmation = 'ｋｋｋ１１１'
        @user.valid?
        expect(@user.errors[:password]).to include("6文字以上半角英数字を含めて設定してください")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "family_nameが空だと登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "family_nameは全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.family_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角（漢字・ひらがな・カタカナ）で入力してください")
      end

      it "first_nameは全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.first_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）で入力してください")
      end

      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角カタカナを入力して下さい")
      end

      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを入力して下さい")
      end


      it "family_name_kanaは全角カタカナ以外では登録できない" do
        @user.family_name_kana = 'kana'
        @user.valid?
        expect(@user.errors[:family_name_kana]).to include("全角カタカナを入力して下さい")
      end

      it "first_name_kanaは全角カタカナ以外では登録できない" do
        @user.first_name_kana = 'kana'
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("全角カタカナを入力して下さい")
      end

      it "birth_dateが空だと登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

    end
  end
end
