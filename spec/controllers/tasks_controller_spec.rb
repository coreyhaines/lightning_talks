require 'spec_helper'

describe TasksController do
  describe "GET index" do
    it "assigns all new tasks to @new_tasks" do
      goal = Goal.create
      get :index, :goal_id => goal.id
      assigns[:new_tasks].should eq(goal.new_tasks)
    end

    it "assigns all started tasks to @started_tasks" do
      goal = Goal.create
      get :index, :goal_id => goal.id
      assigns[:started_tasks].should eq(goal.started_tasks)
    end

    it "assigns all completed tasks to @completed_tasks" do
      goal = Goal.create
      get :index, :goal_id => goal.id
      assigns[:completed_tasks].should eq(goal.completed_tasks)
    end
end

  describe "PUT start" do
    it "marks a task as started" do
      task = stub
      goal = stub
      Goal.stub(:find).with("2") {goal}
      Task.stub(:find).with("1") {task}
      Task.stub(:start!)
      task.should_receive(:start!)
      put :start, :id => "1", :goal_id => "2"
    end

    it "redirects to task list" do
      task = stub
      goal = stub
      Goal.stub(:find).with("2") {goal}
      Task.stub(:find).with("1") {task}
      task.stub(:start!)
      put :start, :id => "1", :goal_id => "2"
      response.should redirect_to(goal_tasks_path(goal))
    end
  end
end
