require 'spec_helper'

feature "showing a list of goals" do
  before :each do
    Project.create name: 'asdfasdf'
  end

  let!(:project) { Project.first }

  example 'create a new goal' do
    visit new_project_goal_path(project)
    fill_in 'Name', :with => 'Ian wants my attention'
    click_button 'Create Goal'

    Goal.last.name.should == 'Ian wants my attention'
    Goal.last.project.should == project
  end

  example 'list of goals is shown at index page' do
    goal1 = project.goals.create(:name => "suck less at life")
    goal2 = project.goals.create(:name => "increase synergy")

    visit project_goals_path(project)

    find('#goal_' + goal1.id.to_s).text.should =~ /suck less at life/
    find('#goal_' + goal2.id.to_s).text.should =~ /increase synergy/
  end

  example 'editing a goal' do
    goal = project.goals.create name: 'bill\'s haircut'
    visit edit_project_goal_path(project, goal)
    fill_in 'Name', :with => 'ian\'s chest haircut'
    click_button 'Update Goal'
    goal.reload
    goal.name.should == 'ian\'s chest haircut'
    goal.project_id.should == project.id
  end

  example 'deleting a goal' do
    goal = project.goals.create name: 'brad\'s genius mind'
    visit project_goals_url(project)
    within '#goal_' + goal.id.to_s do
      click_link 'Delete'
    end
    expect { Goal.find(goal.id) }.should raise_error
  end
end
