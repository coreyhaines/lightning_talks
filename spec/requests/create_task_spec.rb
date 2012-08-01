require 'spec_helper'

feature 'Creating new tasks' do
  example 'create a new task' do
    visit '/tasks/new'
    fill_in 'Name', :with => 'Ian wants my attention'
    click_button 'Create Task'

    Task.last.name.should == 'Ian wants my attention'
  end
end
