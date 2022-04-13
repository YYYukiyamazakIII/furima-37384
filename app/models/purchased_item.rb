class PurchasedItem < ApplicationRecord
  validates :user_id, :item_id, presence: true
  belongs_to :user
  belongs_to :item
  has_one :shipping_addresses
end
