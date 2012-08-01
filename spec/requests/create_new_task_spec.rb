require 'spec_helper'

feature "Creating a new task" do
  example "Text fields exist in Create New Task page" do
    goal = Goal.create description: "Goal 1"
    visit "/goals/#{goal.id}/tasks/new"
    
    fill_in "Description", :with => "Task 1"
    fill_in "Assignee", :with => "Assignee 1"
    click_button "Submit Task"

    current_path.should =="/goals/#{goal.id}/tasks"
  end

  example "Create a New Task will populate a new task in Tasks page" do
    goal = Goal.create description: "Goal 1"
    visit "/goals/#{goal.id}/tasks/new"
    
    fill_in "Description", :with => "Task 1"
    fill_in "Assignee", :with => "Assignee 1"
    click_button "Submit Task"
    
    current_path.should == "/goals/#{goal.id}/tasks"
    page.should have_content("Task 1 by Assignee 1")
  end
  
end
