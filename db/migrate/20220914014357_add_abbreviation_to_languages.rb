class AddAbbreviationToLanguages < ActiveRecord::Migration[7.0]
  def change
    add_column :languages, :abbrev, :string
    add_index :languages, :abbrev, unique: true
  end
end
