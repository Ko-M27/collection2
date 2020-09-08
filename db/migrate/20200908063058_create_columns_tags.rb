class CreateColumnsTags < ActiveRecord::Migration[6.0]
  def change
    create_table :columns_tags do |t|
      t.references :column, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
