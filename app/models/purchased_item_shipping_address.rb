class PurchasedItemShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :area_id, :municipalities, :street_number, :building_name, :phone_number, :token
  validates :user_id, :item_id, :zip_code, :area_id, :municipalities, :street_number, :phone_number, :token, presence: true
  with_options format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" } do
    validates :zip_code
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, numericality: {only_integer: true}, length: { in: 10..11 }
  def save
    purchased_item = PurchasedItem.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(zip_code: zip_code, area_id: area_id, municipalities: municipalities, street_number: street_number, building_name: building_name, phone_number: phone_number, purchased_item_id: purchased_item.id)
  end
end