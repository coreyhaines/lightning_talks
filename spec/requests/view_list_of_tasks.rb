require 'spec_helper'

feature 'showing a list of tasks' do
  example 'list of tasks is shown at page /index' do
    task1 = Task.create(:name => "Ian and his shirt of many colors")
    task2 = Task.create(:name => "Bill nice qr code, but really what does that mean")

    visit '/tasks' 

    find('li#task_' + task1.id.to_s).text.should =~ /Ian and his shirt of many colors/
    find('li#task_' + task2.id.to_s).text.should =~ /Bill nice qr code, but really what does that mean/
  end
end
