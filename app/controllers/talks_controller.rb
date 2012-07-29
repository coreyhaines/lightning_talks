class TalksController < ApplicationController
  def index
    @talks = Talk.all
  end

  def sorted
  end
end
