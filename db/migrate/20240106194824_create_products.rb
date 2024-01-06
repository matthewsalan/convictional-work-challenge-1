class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code
      t.string :title
      t.string :vendor
      t.text :body_html
      t.timestamps
    end
  end
end
