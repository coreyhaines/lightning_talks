require 'spec_helper'

describe TasksController do
  describe "GET index" do
    it "assigns all tasks to @tasks" do
      tasks = stub
      Task.stub(:all) {tasks}
      get :index, :goal_id => 1
      assigns[:tasks].should be(tasks)
    end
  end
end
