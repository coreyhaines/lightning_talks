require "spec_helper"

describe TasksController do
  describe "routing" do

    it "routes to #index" do
      get("/goals/1/tasks").should route_to("tasks#index", :goal_id => "1")
    end

    it "routes to #start" do
      put("/goals/1/tasks/2/start").should route_to("tasks#start", :goal_id => "1", :id => "2")
    end

    it "routes to #complete" do
      put("/goals/1/tasks/2/complete").should route_to("tasks#complete", :goal_id => "1", :id => "2")
    end
  end
end
