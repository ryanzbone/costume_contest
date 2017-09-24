class Entry < ApplicationRecord
  has_attached_file :picture
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  belongs_to :category
  has_many :votes

  def vote_summary
    "#{total_vote_count} (+#{up_vote_count}/-#{down_vote_count})"
  end

  def total_vote_count
    up_vote_count - down_vote_count
  end

  def up_vote_count
    votes.where(up_vote: true).count
  end

  def down_vote_count
    votes.where(up_vote: false).count
  end
end
