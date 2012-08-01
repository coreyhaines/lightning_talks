require 'spec_helper'

feature 'Create, read, update and destroy tasks' do
  before :each do
    Goal.create name: 'blah'
  end

  let!(:goal) { Goal.first }

  example 'create a new task' do
    visit new_goal_task_path(goal)
    fill_in 'Name', :with => 'Ian wants my attention'
    click_button 'Create Task'

    Task.last.name.should == 'Ian wants my attention'
    Task.last.goal.should == goal
  end

  example 'list of tasks is shown at page /index' do
    task1 = goal.tasks.create(:name => "Ian and his shirt of many colors")
    task2 = goal.tasks.create(:name => "Bill nice qr code, but really what does that mean")

    visit goal_tasks_path(goal)

    find('li#task_' + task1.id.to_s).text.should =~ /Ian and his shirt of many colors/
    find('li#task_' + task2.id.to_s).text.should =~ /Bill nice qr code, but really what does that mean/
  end

  example 'clicking on the completed link changes the status to compleated' do
    task = goal.tasks.create(:name => "I hate Brendan", :status => "started")
    visit goal_tasks_path(goal)
    within "#task_" + task.id.to_s do
      click_link "Mark as Completed"
    end
    task.reload
    task.status.should == "completed"
  end

  example 'a newly created task is defaulted to not_started' do
    task = goal.tasks.create(:name => "I hate brendan")
    task.status.should == "not_started"
  end

  example 'clicking on the started link changes the status to started' do
    task = goal.tasks.create(:name => "i hate brendan")
    visit goal_tasks_path(goal)
    within "#task_" + task.id.to_s do
      click_link "Mark as Started"
    end
    task.reload
    task.status.should == "started"
  end

  example 'editing a task' do
    task = goal.tasks.create name: 'bill\'s haircut'
    visit edit_goal_task_path(goal, task)
    fill_in 'Name', :with => 'ian\'s chest haircut'
    click_button 'Update Task'
    task.reload
    task.name.should == 'ian\'s chest haircut'
    task.goal_id.should == goal.id
  end

  example 'deleting a task' do
    task = goal.tasks.create name: 'brad\'s genius mind'
    visit goal_tasks_url(goal)
    within '#task_' + task.id.to_s do
      click_link 'Delete'
    end
    expect { Task.find(task.id) }.should raise_error
  end
end
