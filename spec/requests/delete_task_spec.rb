require 'spec_helper'

feature 'Deleting tasks' do
  example 'deleting a task' do
    task = Task.create name: 'brad\'s genius mind'
    visit tasks_url
    within '#task_' + task.id.to_s do
      click_link 'Delete'
    end
    lambda { Task.find(task.id) }.should raise_error
  end
end
