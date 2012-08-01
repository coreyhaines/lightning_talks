require 'spec_helper'

describe TasksController do
  describe "GET index" do
    it "assigns all new tasks to @new_tasks" do
      new_tasks = stub
      goal = stub
      Goal.stub(:find).with("1")
      goal.stub(:new_tasks) {new_tasks}
      goal.stub(:started_tasks)
      goal.stub(:completed_tasks)
      get :index, :goal_id => 1
      assigns[:new_tasks].should be(new_tasks)
    end

    it "assigns all started tasks to @started_tasks" do
      started = stub
      goal = stub
      Goal.stub(:find).with("1")
      goal.stub(:started_tasks) {started}
      goal.stub(:new_tasks)
      goal.stub(:completed_tasks)
      get :index, :goal_id => 1
      assigns[:started_tasks].should be(started)
    end

    it "assigns all completed tasks to @completed_tasks" do
      completed_tasks = stub
      goal = stub
      Goal.stub(:find).with("1")
      goal.stub(:completed_tasks) {completed_tasks}
      goal.stub(:started_tasks)
      goal.stub(:new_tasks)
      get :index, :goal_id => 1
      assigns[:completed_tasks].should be(completed_tasks)
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
