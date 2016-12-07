class PriceIsFloat < ActiveRecord::Migration
  def change
    change_column :tickets, :price, :float
  end
end
