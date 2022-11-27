class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.string :name, null: false
      t.string :abbreviation, null: false
      t.string :special_chars, null: false, array: true, default: []

      t.timestamps
    end
  end
end
