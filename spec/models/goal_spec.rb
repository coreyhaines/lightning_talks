require 'spec_helper'

describe Goal do
  describe "Initial Conditions" do
    it "sets completed to false by default" do
      goal = Goal.create
      goal.completed.should == false
    end
  end

  describe "#new_tasks" do
    it "returns all new tasks belonging to it" do
      goal = Goal.create
      t1 = Task.create goal: goal
      t2 = Task.create goal: goal, started: true
      t3 = Task.create

      tasks = goal.new_tasks
      tasks.should =~ [t1]
    end
  end
  describe "#started_tasks" do
    it "returns all started tasks belonging to it" do
      goal = Goal.create
      t1 = Task.create goal: goal
      t2 = Task.create goal: goal, started: true
      t3 = Task.create goal: goal, started: true, completed: true

      tasks = goal.started_tasks
      tasks.should =~ [t2]
    end
  end
  describe "#completed_tasks" do
    it "returns all new tasks belonging to it" do
      goal = Goal.create
      t1 = Task.create goal: goal
      t2 = Task.create goal: goal, started: true
      t3 = Task.create goal: goal, started: true, completed: true

      tasks = goal.completed_tasks
      tasks.should =~ [t3]
    end
  end
end
