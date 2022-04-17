class PurchasedItemsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    if PurchasedItem.exists?(item_id: @item.id)
      redirect_to root_path
    elsif @item.user_id == current_user.id
      redirect_to root_path
    end
    @purchased_item_shipping_address = PurchasedItemShippingAddress.new
  end

  def create
    @purchased_item_shipping_address = PurchasedItemShippingAddress.new(purchased_item_shipping_address_params)
    if @purchased_item_shipping_address.valid?
      pay_item
      @purchased_item_shipping_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchased_item_shipping_address_params
    params.require(:purchased_item_shipping_address).permit(:zip_code, :area_id, :municipalities, :street_number, :building_name,
                                                            :phone_number).merge(user_id: current_user.id,
                                                                                 item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchased_item_shipping_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
