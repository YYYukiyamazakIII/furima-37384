class GoodItemsController < ApplicationController
  def create
    unless GoodItem.where(user_id: current_user.id, item_id: params[:item_id]).present?
      GoodItem.create(user_id: current_user.id, item_id: params[:item_id])
      good_item_count = GoodItem.where(item_id: params[:item_id]).count
      render json: { good_item_count: good_item_count }
    end
  end

  def destroy
    GoodItem.find(params[:id]).destroy
    good_item_count = GoodItem.where(item_id: params[:item_id]).count
    render json: { good_item_count: good_item_count }
  end
end
