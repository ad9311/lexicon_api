class AddReferenceToDictionaries < ActiveRecord::Migration[7.0]
  def change
    add_index :dictionaries, :source_id
    add_index :dictionaries, :target_id
    add_foreign_key :dictionaries, :languages, column: :source_id
    add_foreign_key :dictionaries, :languages, column: :target_id
  end
end
