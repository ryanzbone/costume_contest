class HouseVotingController < ApplicationController
  def index
    house_ids = Entry.where(category: Category.house).pluck(:id)
    vote_ids = Vote.where(voter: current_voter).pluck(:entry_id)
    if house_ids.length != vote_ids.length
      @entry = Entry.find((house_ids - vote_ids).sample)
    else
      @entry = nil
    end
  end

  def up_vote
    vote = Vote.new(up_vote: true, entry_id: params[:entry_id], voter: current_voter)
    if vote.save
      redirect_to houses_path
    else
      @entry = Entry.find params[:entry_id]
      render :index
    end
  end

  def down_vote
    vote = Vote.new(up_vote: false, entry_id: params[:entry_id], voter: current_voter)
    if vote.save
      redirect_to houses_path
    else
      @entry = Entry.find params[:entry_id]
      render :index
    end
  end
end
