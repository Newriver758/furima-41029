class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_day

  has_one_attached :image

  validates :name, :description, :price, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_day_id,
            presence: true
  validates :image, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :shipping_day_id, presence: true
end
