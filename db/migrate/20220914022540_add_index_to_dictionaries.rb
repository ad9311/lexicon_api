class AddIndexToDictionaries < ActiveRecord::Migration[7.0]
  def change
    add_index :dictionaries, :name, unique: true
  end
end
