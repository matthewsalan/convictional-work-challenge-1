class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.text :source
      t.references :variant
      t.timestamps
    end
  end
end
