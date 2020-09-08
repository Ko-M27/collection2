class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :text_1, null: false
      t.text :text_2
      t.string :shipping_fee, null: false
      t.integer :category_id, foreign_key: true, null: false
      t.integer :user_buyer_id, foreign_key: true
      t.integer :user_seller_id, foreign_key: true, fnull: false
      t.timestamps
    end
  end
end
