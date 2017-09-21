class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :entry, foreign_key: true
      t.references :voter, foreign_key: true

      t.timestamps
    end
  end
end
