class ChangeUnitPricesToFloat < ActiveRecord::Migration
  def change
    change_column :invoice_items, :unit_price, :float
    change_column :items, :unit_price, :float
  end
end
