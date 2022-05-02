require 'rails_helper'

RSpec.describe GoodItem, type: :model do
  before do
    @good_item = FactoryBot.create(:good_item)
  end

  describe 'いいね機能' do
    context 'いいね登録ができるとき' do
      it 'userとitemが紐づいていると登録できる' do
        expect(@good_item).to be_valid
      end
    end
    context 'いいね登録ができないとき' do
      it 'userが紐づいていないと登録できない' do
        @good_item.user_id = ''
        @good_item.valid?
        expect(@good_item.errors.full_messages).to include 'User must exist'
      end
      it 'itemが紐づいていないと登録できない' do
        @good_item.item_id = ''
        @good_item.valid?
        expect(@good_item.errors.full_messages).to include 'Item must exist'
      end
    end
  end
end
