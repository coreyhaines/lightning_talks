class TalksController < ApplicationController
  def index
    @talks = Talk.all
  end

  def sorted
    @talks = Talk.sorted_by_vote_count
    render :index
  end

  def new
    @talk = Talk.new
  end

  def create
    Talk.create params[:talk]
    redirect_to talks_url
  end
end
