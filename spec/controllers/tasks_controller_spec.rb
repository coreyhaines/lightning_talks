require 'spec_helper'

describe TasksController do
  describe "GET index" do
    it "assigns all tasks to @tasks" do
      tasks = stub
      goal = stub
      Goal.stub(:find).with("1")
      Task.stub(:all) {tasks}
      get :index, :goal_id => 1
      assigns[:tasks].should be(tasks)
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
