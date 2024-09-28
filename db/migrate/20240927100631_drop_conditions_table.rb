class DropConditionsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :conditions
  end
end
