require 'spec_helper'

describe TasksController do
  describe "routing" do

    it "routes to #index" do
      get("/goals/1/tasks").should route_to("tasks#index", :goal_id => "1")
    end
  end
end
