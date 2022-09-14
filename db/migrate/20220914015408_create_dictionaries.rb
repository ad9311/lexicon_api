class CreateDictionaries < ActiveRecord::Migration[7.0]
  def change
    create_table :dictionaries do |t|
      t.integer :source_id
      t.integer :target_id
      t.string :name

      t.timestamps
    end
  end
end
