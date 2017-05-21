class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :url, default: "http://imgur.com/PwqHArq"
      t.integer :product_id

      t.timestamps
    end
  end
end
