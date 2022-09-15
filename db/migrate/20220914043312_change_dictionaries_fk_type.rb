class ChangeDictionariesFkType < ActiveRecord::Migration[7.0]
  def change
    change_column :dictionaries, :source_id, :bigint
    change_column :dictionaries, :target_id, :bigint
  end
end
