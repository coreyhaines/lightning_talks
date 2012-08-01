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
end
