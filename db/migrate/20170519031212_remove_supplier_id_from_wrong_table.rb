class RemoveSupplierIdFromWrongTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :suppliers, :supplier_id, :intger
  end
end
