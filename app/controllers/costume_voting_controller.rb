class CostumeVotingController < ApplicationController
  before_action :require_voting_enabled

  def index
    @costume_ids = Entry.where.not(category: Category.house).pluck(:id)
    vote_ids = Vote.where(voter: current_voter).pluck(:entry_id)
    house_ids = Entry.where(category: Category.house).pluck(:id)
    @existing_costume_votes = vote_ids - house_ids
    @progress = (@existing_costume_votes.count.to_f / @costume_ids.count.to_f) * 100
    @voting_complete = vote_ids.count == (house_ids.count + @costume_ids.count)

    if @costume_ids.length != @existing_costume_votes.length
      @entry = Entry.find((@costume_ids - vote_ids).sample)
    else
      @entry = nil
    end
  end

  def up_vote
    vote = Vote.new(up_vote: true, entry_id: params[:entry_id], voter: current_voter)
    if vote.save
      redirect_to costumes_path
    else
      @entry = Entry.find params[:entry_id]
      render :index
    end
  end

  def down_vote
    vote = Vote.new(up_vote: false, entry_id: params[:entry_id], voter: current_voter)
    if vote.save
      redirect_to costumes_path
    else
      @entry = Entry.find params[:entry_id]
      render :index
    end
  end
end
