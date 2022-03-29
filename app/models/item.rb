class Item < ApplicationRecord
  validates :image, :name, :explanation, :category_id, :status_id, :delivery_charge_id,
  :area_id, :date_of_shipping_id, :user_id, presence: true

  validates :area_id, :category_id, :date_of_shipping_id, :delivery_charge_id, :status_id, 
  numericality: { other_than: 1 ,message: "can't be blank" }

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'は半角数字を使用してください' } do
    validates :price
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :date_of_shipping
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :status
end
