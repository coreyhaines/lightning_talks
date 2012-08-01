class GoalsController < ApplicationController
  before_filter :get_project

  def index
    @goals = @project.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = @project.goals.create params[:goal]
    redirect_to project_goals_url(@project)
  end

  def edit
    @goal = Goal.find params[:id]
  end

  def update
    @goal = Goal.find params[:id]
    @goal.update_attributes params[:goal]
    redirect_to project_goals_url(@project)
  end

  def destroy
    Goal.find(params[:id]).destroy
    redirect_to project_goals_url(@project)
  end

  private
  def get_project
    @project = Project.find(params[:project_id])
  end
end
