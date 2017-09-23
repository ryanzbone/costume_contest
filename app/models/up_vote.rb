class UpVote < ApplicationRecord
  belongs_to :entry
  belongs_to :voter
end
