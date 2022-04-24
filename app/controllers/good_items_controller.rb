class GoodItemsController < ApplicationController

  def create
    unless GoodItem.where(user_id:current_user.id, item_id: params[:item_id]).present?
      GoodItem.create(user_id:current_user.id, item_id: params[:item_id])
    end
  end

  def destroy
  end

end
