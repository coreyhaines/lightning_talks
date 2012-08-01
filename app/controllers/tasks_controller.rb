class TasksController < ApplicationController
  def index
    @goal = Goal.find(params[:goal_id])
    @completed_tasks = Task.completed_tasks
    @uncompleted_tasks = Task.uncompleted_tasks
  end

  def completed
    @goal = Goal.find(params[:goal_id])
    @tasks = Task.completed_tasks
  end
 
  def uncompleted
    @goal = Goal.find(params[:goal_id])
    @tasks = Task.uncompleted_tasks
  end
  
  def new
    @goal = Goal.find(params[:goal_id])
    @task = Task.new
  end

  def create
    @task = Task.create(params[:task])
    redirect_to goal_tasks_url
  end

end
