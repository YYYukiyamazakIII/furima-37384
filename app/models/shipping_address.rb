class ShippingAddress < ApplicationRecord
  belongs_to :purchased_item
end
