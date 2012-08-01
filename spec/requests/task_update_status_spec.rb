require 'spec_helper'

def prep
  goal = Goal.create name: "Power"
  visit "/goals/#{goal.id}/tasks"
  return goal
end

describe "Change task status" do
  describe "Started" do
    example "Clicking the started link marks task as started" do
      task = Task.create name: "wealth"
      goal = prep
      within(".task#task_#{task.id}") do
        click_link "Start"
      end
      task.reload
      task.started.should == true
    end
  end
  describe "Completed" do
    example "Clicking the completed link marks task as completed" do
      task = Task.create name: "wealth", started: true
      goal = prep
      within(".task#task_#{task.id}") do
        click_link "Complete"
      end
      task.reload
      task.completed.should == true
    end
  end
end
