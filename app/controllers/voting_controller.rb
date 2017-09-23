class VotingController < ApplicationController
  def index
    entry_ids = Entry.pluck(:id)
    vote_ids = Vote.where(voter: current_voter).pluck(:entry_id)
    if entry_ids.length != vote_ids.length
      @entry = Entry.find((entry_ids - vote_ids).sample)
    else
      @entry = nil
    end
  end

  def up_vote
    vote = Vote.new(up_vote: true, entry_id: params[:entry_id], voter: current_voter)
    if vote.save
      redirect_to root_path
    else
    end
  end

  def down_vote
    redirect_to root_path
  end
end
