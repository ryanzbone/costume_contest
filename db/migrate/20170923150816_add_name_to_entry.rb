class AddNameToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :name, :string
  end
end
