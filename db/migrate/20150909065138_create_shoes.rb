class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.references :seller, index: true, foreign_key: true
      t.references :buyer, index: true, foreign_key: true
      t.integer :amount
      t.string :name

      t.timestamps null: false
    end
  end
end
