class CreateShippingDays < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_days do |t|
      t.string :name, null: false  

      t.timestamps
    end
  end
end
