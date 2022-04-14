require 'rails_helper'

RSpec.describe PurchasedItemShippingAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchased_item_shipping_address = FactoryBot.build(:purchased_item_shipping_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    context '商品購入ができるとき' do
      it '建物名が空でも登録できる' do
        @purchased_item_shipping_address.building_name = ''
        expect(@purchased_item_shipping_address).to be_valid
      end
    end
    context '商品購入ができないとき' do
      it 'user_idが紐づいていないと登録できない' do
        @purchased_item_shipping_address.user_id = ''
        @purchased_item_shipping_address.valid?
        expect(@purchased_item_shipping_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが紐づいていないと登録できない' do
        @purchased_item_shipping_address.item_id = ''
        @purchased_item_shipping_address.valid?
        expect(@purchased_item_shipping_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'zip_codeが空では登録できない' do
        @purchased_item_shipping_address.zip_code = ''
        @purchased_item_shipping_address.valid?
        expect(@purchased_item_shipping_address.errors.full_messages).to include "Zip code can't be blank"
      end
      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchased_item_shipping_address.zip_code = Faker::Number.number(digits: 7)
        @purchased_item_shipping_address.valid?
        expect(@purchased_item_shipping_address.errors.full_messages).to include 'Zip code is invalid. Include hyphen(-)'
      end
      it 'area_idに「---」が選択されている場合は購入できないこと' do
        @purchased_item_shipping_address.area_id = 1
        @purchased_item_shipping_address.valid?
        expect(@purchased_item_shipping_address.errors.full_messages).to include "Area can't be blank"
      end
      it 'municipalitiesが空では登録できない' do
        @purchased_item_shipping_address.municipalities = ''
        @purchased_item_shipping_address.valid?
        expect(@purchased_item_shipping_address.errors.full_messages).to include "Municipalities can't be blank"
      end
      it 'street_numberが空では登録できない' do
        @purchased_item_shipping_address.street_number = ''
        @purchased_item_shipping_address.valid?
        expect(@purchased_item_shipping_address.errors.full_messages).to include "Street number can't be blank"
      end
      it 'phone_numberが空では登録できない' do
        @purchased_item_shipping_address.phone_number = ''
        @purchased_item_shipping_address.valid?
        expect(@purchased_item_shipping_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが半角数字以外だと登録できない' do
        @purchased_item_shipping_address.phone_number = Faker::Lorem.characters(number: 10, min_alpha: 1)
        @purchased_item_shipping_address.valid?
        expect(@purchased_item_shipping_address.errors.full_messages).to include 'Phone number is not a number'
      end
      it 'phone_numberが9桁以下だと登録できない' do
        @purchased_item_shipping_address.phone_number = Faker::Number.number(digits: 9)
        @purchased_item_shipping_address.valid?
        expect(@purchased_item_shipping_address.errors.full_messages).to include
        'Phone number is too short (minimum is 10 characters)'
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @purchased_item_shipping_address.phone_number = Faker::Number.number(digits: 12)
        @purchased_item_shipping_address.valid?
        expect(@purchased_item_shipping_address.errors.full_messages).to include
        'Phone number is too long (maximum is 11 characters)'
      end
      it 'tokenが空では登録できない' do
        @purchased_item_shipping_address.token = ''
        @purchased_item_shipping_address.valid?
        expect(@purchased_item_shipping_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
