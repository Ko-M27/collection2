class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :zipcode, null: false
      t.string :prefecuture, null: false
      t.string :city, null: false
      t.string :local, null: false
      t.string :building_name
      t.string :phone_number
      t.references :user
      t.timestamps
    end
  end
end
