class Category < ApplicationRecord
  def self.house
    find_by name: 'House'
  end
end
