class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :find_or_create_voter

  helper_method :current_voter

  def current_voter
    @current_voter ||= Voter.find_by(uuid: cookies[:voter_uuid])
  end

  def find_or_create_voter
    if cookies.permanent[:voter_uuid].blank?
      uuid = SecureRandom.uuid
      Voter.create! uuid: uuid
      cookies.permanent[:voter_uuid] = uuid
    end
  end
end
