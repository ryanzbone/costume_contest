require 'rails_helper'

RSpec.feature 'voting order' do

  before do
    FactoryGirl.create_list :entry, 5
  end

  it 'displays the entries one at a time in a random order, without displaying duplicates' do
    entry_view_counts =  {}
    Entry.all.each do |entry|
      entry_view_counts[entry.name] = 0
    end

    5.times do
      visit '/'
      entry_view_counts[find('#entry-name').text] += 1
      click_button "Up Vote"
    end

    entry_view_counts.each do |_, v|
      expect(v).to eq(1)
    end

    Entry.all.each do |entry|
      expect(entry.up_vote_count).to eq(1)
    end
  end
end
