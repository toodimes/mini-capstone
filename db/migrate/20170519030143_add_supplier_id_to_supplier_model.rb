class AddSupplierIdToSupplierModel < ActiveRecord::Migration[5.0]
  def change
    add_column :suppliers, :suplier_id, :integer
  end
end
