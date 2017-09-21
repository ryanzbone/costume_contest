class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :contact_info
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
