class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def completed
    task = Task.find(params[:task_id])
    task.status = "completed"
    task.save
    redirect_to tasks_url
  end
  def started
    task = Task.find(params[:task_id])
    task.status = "started"
    task.save
    redirect_to tasks_url
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create params[:task]
    redirect_to tasks_url
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    @task.update_attributes params[:task]
    redirect_to tasks_url
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_url
  end
end
