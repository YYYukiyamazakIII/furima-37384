class GoodItemsController < ApplicationController
  def create
    if GoodItem.where(user_id: current_user.id, item_id: params[:item_id]).present?
      good_item = GoodItem.where(user_id: current_user.id, item_id: params[:item_id])[0]
      render json: { judge: "false", itemId: good_item.item_id, goodItemId: good_item.id }
    else
      GoodItem.create(user_id: current_user.id, item_id: params[:item_id])
      render json: { goodItemCount: GoodItem.where(item_id: params[:item_id]).count }
    end
  end

  def destroy
    GoodItem.find(params[:id]).destroy
    render json: { goodItemCount: GoodItem.where(item_id: params[:item_id]).count }
  end
end
