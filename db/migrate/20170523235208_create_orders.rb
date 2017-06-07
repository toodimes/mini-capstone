class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.string :subtotal, precision: 9, scale: 2
      t.string :tax, precision: 9, scale: 2
      t.string :total, precision: 9, scale: 2

      t.timestamps
    end
  end
end
