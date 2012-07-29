class TalksController < ApplicationController
  def index
    @talks = Talk.all
  end

  def sorted
    @talks = Talk.sorted_by_vote_count
    render :index
  end

  def new
  end
end
