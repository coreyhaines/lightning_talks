class VotesController < ApplicationController
  def create
    talk = Talk.find params[:talk_id]
    talk.add_vote!
    redirect_to talks_url
  end
end
