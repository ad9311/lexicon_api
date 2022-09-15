class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.string :source
      t.string :target
      t.integer :classif
      t.integer :gender
      t.references :dictionary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
