require 'spec_helper'

feature "Check links on all pages" do
  example "Check link to Completed Tasks on Tasks page" do
    goal = Goal.create description: "Goal 1"
    visit "/goals/#{goal.id}/tasks"
   
    p current_path
    p "--".center(500, "*")

    click_link "Completed Tasks" 
    current_path.should == completed_goal_tasks_path
  end

  example "Check link to Uncompleted Tasks on Tasks page" do 
    goal = Goal.create description: "Goal 1"
    visit "/goals/#{goal.id}/tasks"
    
    click_link "Uncompleted Tasks" 
    current_path.should == uncompleted_goal_tasks_path
  end
 
  example "Check link to Tasks page from Completed Tasks" do
    goal = Goal.create description: "Goal 1"
    visit "/goals/#{goal.id}/tasks/completed"
    
    click_link "All Tasks"
    current_path.should == goal_tasks_path 
  end

  example "Check link to Tasks page from Uncompleted Tasks" do
    goal = Goal.create description: "Goal 1"
    visit "/goals/#{goal.id}/tasks/uncompleted"
    
    click_link "All Tasks"
    current_path.should == goal_tasks_path
  end
  
  example "Check link to Create New Task page from Tasks page" do
    goal = Goal.create description: "Goal 1"
    visit "/goals/#{goal.id}/tasks"
    
    click_link "Create New Task"
    current_path.should == new_goal_task_path
  end
 end
