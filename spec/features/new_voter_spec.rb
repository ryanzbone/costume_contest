require 'rails_helper'

RSpec.feature 'New voter' do

  before do
    create :entry
  end

  context 'when visiting for the first time' do
    it 'creates a new voter record' do
      expect { visit '/' }.to change { Voter.count }.by(1)
      expect(page.html).to include Voter.first.uuid
    end
  end

  context 'when visting a second time' do
    it 'does not create a new voter record and uses the old one' do
      expect { visit '/' }.to change { Voter.count }.by(1)
      expect(page.html).to include Voter.first.uuid
      expect { visit '/' }.not_to change { Voter.count }
      expect(page.html).to include Voter.first.uuid
    end
  end
end
