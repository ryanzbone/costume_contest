class FeatureFlag < ApplicationRecord
  def self.voting
    find_or_create_by(name: 'voting')
  end
end
