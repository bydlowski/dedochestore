class CreateDedoches < ActiveRecord::Migration
  def change
    create_table :dedoches do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :stock
      t.text :image
      t.string :code

      t.timestamps null: false
    end
  end
end
