class TasksController < ApplicationController
  before_filter :get_goal

  def index
    @tasks = @goal.tasks
  end

  def completed
    task = Task.find(params[:task_id])
    task.status = "completed"
    task.save
    redirect_to goal_tasks_url(@goal)
  end

  def started
    task = Task.find(params[:task_id])
    task.status = "started"
    task.save
    redirect_to goal_tasks_url(@goal)
  end

  def new
    @task = Task.new
  end

  def create
    @task = @goal.tasks.create params[:task]
    redirect_to goal_tasks_url(@goal)
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    @task.update_attributes params[:task]
    redirect_to goal_tasks_url(@goal)
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to goal_tasks_url(@goal)
  end

  private
  def get_goal
    @goal = Goal.find(params[:goal_id])
  end
end
