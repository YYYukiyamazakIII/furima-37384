require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、date_of_birthが存在すれば登録で
      きる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailは＠を含まないと登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下ではでは登録できない' do
        @user.password = Faker::Lorem.characters(number: 2..5, min_alpha: 1, min_numeric: 1)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Lorem.characters(number: 129, min_alpha: 1, min_numeric: 1)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too long (maximum is 128 characters)'
      end
      it 'passwordは半角英字だけでは登録できない' do
        @user.password = Faker::Lorem.characters(number: 6, min_alpha: 6)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'passwordは半角数字だけでは登録できない' do
        @user.password = Faker::Lorem.characters(number: 6, min_numeric: 6)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'passwordは全角文字を含むと登録できない' do
        @user.password = "#{Faker::Lorem.characters(number: 6..125, min_alpha: 1, min_numeric: 1)} １２３"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = Faker::Lorem.characters(number: 129)
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameは全角(漢字・ひらがな・カタカナ)でなければ登録できない' do
        @user.last_name = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name は全角文字を使用してください'
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameは全角(漢字・ひらがな・カタカナ)でなければ登録できない' do
        @user.first_name = Faker::Name.first_name
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name は全角文字を使用してください'
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'last_name_kanaは全角(カタカナ)でなければ登録できない' do
        @user.last_name_kana = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana はカタカナを使用してください'
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'first_name_kanaは全角(カタカナ)でなければ登録できない' do
        @user.first_name_kana = Faker::Name.first_name
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana はカタカナを使用してください'
      end
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Date of birth can't be blank"
      end
    end
  end
end
