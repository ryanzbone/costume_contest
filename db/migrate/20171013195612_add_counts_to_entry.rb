class AddCountsToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :up_votes, :int, default: 0
    add_column :entries, :down_votes, :int, default: 0
    add_column :entries, :net_votes, :int, default: 0
  end
end
