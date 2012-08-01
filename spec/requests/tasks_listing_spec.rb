require 'spec_helper'

feature "Viewing list of tasks" do
  
  example "No task should display empty Tasks page" do
    goal = Goal.create description: "Goal 1"
    visit "/goals/#{goal.id}/tasks"
    
    all(".tasks.completed.task").should be_empty
    all(".tasks.uncompleted.task").should be_empty
  end

  example "One task will show on Tasks page" do
    goal = Goal.create description: "Goal 1"
    task = Task.create assignee: "Assignee 1", description: "Task 1"
    
    visit "/goals/#{goal.id}/tasks"
    page.should have_css(".tasks.uncompleted", text: "Assignee 1")
  end

  example "Default status of task should be Not Started" do
    Task.create.status.should == "Not Started"
  end
    
  example "Tasks are grouped by status" do
    task1 = Task.create assignee: "Assignee 1", description: "Task 1"
    task2 = Task.create assignee: "Assignee 2", description: "Task 2"
    task3 = Task.create assignee: "Assignee 1", description: "Task 3"

    task1.update_attribute :status, "Completed"
    task3.update_attribute :status, "Started"

    goal = Goal.create description: "Goal 1"
    visit "/goals/#{goal.id}/tasks"
 
    within(".tasks.uncompleted") do 
      find("#task_#{task2.id}")
      find("#task_#{task3.id}")
    end

    within(".tasks.completed") do
      find("#task_#{task1.id}") 
    end

  end
end
