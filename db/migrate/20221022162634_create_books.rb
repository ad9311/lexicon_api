class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_reference :books, :source, foreign_key: { to_table: :languages }
    add_reference :books, :target, foreign_key: { to_table: :languages }
  end
end
