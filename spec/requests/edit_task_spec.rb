require 'spec_helper'

feature 'Editing tasks' do
  example 'editing a task' do
    task = Task.create name: 'bill\'s haircut'
    visit edit_task_path(task)
    fill_in 'Name', :with => 'ian\'s chest haircut'
    click_button 'Update Task'
    task.reload
    task.name.should == 'ian\'s chest haircut'
  end
end
