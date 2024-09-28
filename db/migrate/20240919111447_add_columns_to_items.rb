class AddColumnsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :name, :string
    add_column :items, :description, :text
    add_column :items, :price, :integer
    add_column :items, :category_id, :integer
    add_column :items, :condition_id, :integer
    add_column :items, :shipping_charge_id, :integer
    add_column :items, :prefecture_id, :integer
    add_column :items, :shipping_day_id, :integer
    add_reference :items, :user, null: false, foreign_key: true
  end
end
