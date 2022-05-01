require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.create(:comment)
    sleep(0.5)
  end
  describe 'コメント機能' do
    context 'コメントが登録できるとき' do
      it 'textが存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントが登録できないとき' do
      it 'textが空では登録できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Text can't be blank"
      end
      it 'userが紐づいていないと登録できない' do
        @comment.user_id = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'User must exist'
      end
      it 'itemが紐づいていないと登録できない' do
        @comment.item_id = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'Item must exist'
      end
    end
  end
end
