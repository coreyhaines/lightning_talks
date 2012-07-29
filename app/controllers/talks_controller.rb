class TalksController < ApplicationController
  include ActiveModel::MassAssignmentSecurity
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
    Talk.create sanitize_for_mass_assignment(params[:talk], :default)
    redirect_to talks_url
  end
end
