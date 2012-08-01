class TasksController < ApplicationController
  before_filter :find_goal

  def find_goal
    @goal = Goal.find(params[:goal_id])
  end

  def index
    @new_tasks = @goal.new_tasks
    @started_tasks = @goal.started_tasks
    @completed_tasks = @goal.completed_tasks
  end

  def start
    task = Task.find(params[:id])
    task.start!
    redirect_to goal_tasks_path(@goal)
  end

  def complete
    task = Task.find(params[:id])
    task.complete!
    redirect_to goal_tasks_path(@goal)
  end

  def new
    @task = Task.new(goal: @goal)
  end

  def create
    Task.create params[:task]
    redirect_to goal_tasks_path(@goal)
  end

end
