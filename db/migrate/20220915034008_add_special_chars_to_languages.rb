class AddSpecialCharsToLanguages < ActiveRecord::Migration[7.0]
  def change
    add_column :languages, :special_chars, :string, default: ""
  end
end
