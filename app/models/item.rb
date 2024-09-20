class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :description, :price, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_day_id,
            presence: true
  validates :image, presence: true
end
