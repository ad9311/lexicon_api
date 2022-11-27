class AddUniqueNameToLanguage < ActiveRecord::Migration[7.0]
  def change
    add_index :languages, :name, unique: true
    add_index :languages, :abbreviation, unique: true
  end
end
