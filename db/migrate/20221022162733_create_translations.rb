class CreateTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :translations do |t|
      t.references :book, null: false, foreign_key: true
      t.references :source, null: false, foreign_key: true
      t.references :target, null: false, foreign_key: true

      t.timestamps
    end
  end
end
