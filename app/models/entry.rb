class Entry < ApplicationRecord
  has_attached_file :picture
  belongs_to :category
  has_many :votes

  def up_vote_count
    votes.where(up_vote: true).count
  end

  def down_vote_count
    votes.where(up_vote: false).count
  end
end
