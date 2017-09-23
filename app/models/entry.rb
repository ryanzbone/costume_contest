class Entry < ApplicationRecord
  has_attached_file :picture
  belongs_to :category
  has_many :up_votes
  has_many :down_votes
end
