class CreateColumns < ActiveRecord::Migration[6.0]
  def change
    create_table :columns do |t|
      t.string :image
      t.text :text
      t.string :tittle
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
