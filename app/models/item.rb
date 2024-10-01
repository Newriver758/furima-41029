class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_day

  # has_one :order

  has_one_attached :image

  validates :name, :description, :price, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_day_id,
            presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
  validates :prefecture_id, :shipping_charge_id, :shipping_day_id, :category_id, :condition_id,
            numericality: { other_than: 0, message: 'must be other than 0' }
end
