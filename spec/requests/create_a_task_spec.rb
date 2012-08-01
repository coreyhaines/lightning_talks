require 'spec_helper'

describe "Creating a task" do
  example "actually creates a task" do
    goal = Goal.create name: "Power"
    visit "/goals/#{goal.id}/tasks/"
    click_link "Add task"

    fill_in 'task_name', with: "sleep"
    fill_in 'task_description', with: "ZZZzzz"
    fill_in 'task_person', with: "intern"
    click_button "Create Task"

    task = Task.find_by_name("sleep")
    rtask = find(".task#task_#{task.id}")

    rtask.text.should =~ /sleep/
    rtask.text.should =~ /ZZZzzz/
    rtask.text.should =~ /intern/
  end
end
