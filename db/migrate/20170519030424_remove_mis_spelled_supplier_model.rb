class RemoveMisSpelledSupplierModel < ActiveRecord::Migration[5.0]
  def change
    remove_column :suppliers, :suplier_id, :integer
  end
end
