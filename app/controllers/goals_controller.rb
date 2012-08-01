class GoalsController < ApplicationController
  def index
    @uncompleted_goals = Goal.uncompleted
    @completed_goals = Goal.completed
  end

  def completed
    @goals = Goal.completed
  end

  def uncompleted
    @goals = Goal.uncompleted
  end
end
