require 'spec_helper'

feature 'user can mark tasks as completed' do
  example 'clicking on the completed link changes the status to compleated' do
    task = Task.create(:name => "I hate Brendan", :status => "started")
    visit "/tasks"
    within "#task_" + task.id.to_s do
      click_link "Mark as Completed"
    end
    task.reload
    task.status.should == "completed"
  end

  example 'a newly created task is defaulted to not_started' do
    task = Task.create(:name => "I hate brendan")
    task.status.should == "not_started"
  end
  example 'clicking on the started link changes the status to started' do
    task = Task.create(:name => "I hate Brendan")
    visit "/tasks"
    within "#task_" + task.id.to_s do
      click_link "Mark as Started"
    end
    task.reload
    task.status.should == "started"
  
  end
  

end
