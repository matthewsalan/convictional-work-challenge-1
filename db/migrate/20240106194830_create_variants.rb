class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.string :title
      t.string :sku
      t.boolean :available
      t.integer :inventory_quantity
      t.integer :weight
      t.string :weight_unit
      t.references :product
      t.timestamps
    end
  end
end
