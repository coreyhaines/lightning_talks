class VotesController < ApplicationController
  def create
    redirect_to talks_url
  end
end
