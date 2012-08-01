require 'spec_helper'

feature "showing a list of goals" do
  example 'list of goals is shown at index page' do
    goal1 = Goal.create(:name => "suck less at life")
    goal2 = Goal.create(:name => "increase synergy")

    visit '/goals'

    find('li#goal_' + goal1.id.to_s).text.should =~ /suck less at life/
    find('li#goal_' + goal2.id.to_s).test.should =~ /increase synergy/
  end
end
