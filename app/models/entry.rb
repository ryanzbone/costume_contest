class Entry < ApplicationRecord
  has_attached_file :picture
  belongs_to :category
  has_many :votes
end
