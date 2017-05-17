class AddInStockAttribute < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :in_stock, :boolean, default: true
    add_column :products, :rating, :float, default: 3.0
  end
end
