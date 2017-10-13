class Vote < ApplicationRecord
  belongs_to :entry
  belongs_to :voter

  after_save :update_entry_count

  def update_entry_count
    if up_vote
      entry.update(
        up_votes: entry.up_votes + 1,
        net_votes: entry.net_votes + 1
      )
    else
      entry.update(
        down_votes: entry.down_votes - 1,
        net_votes: entry.net_votes - 1
      )
    end
  end
end
