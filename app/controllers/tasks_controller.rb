class TasksController < ApplicationController
  def index
    @goal = Goal.find(params[:goal_id])
    @tasks = Task.all
  end

  def start
    goal = Goal.find(params[:goal_id])
    task = Task.find(params[:id])
    task.start!
    redirect_to goal_tasks_path(goal)
  end

  def complete
    goal = Goal.find(params[:goal_id])
    task = Task.find(params[:id])
    task.complete!
    redirect_to goal_tasks_path(goal)
  end
end
