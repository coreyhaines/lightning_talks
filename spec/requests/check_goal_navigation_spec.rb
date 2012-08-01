require 'spec_helper'

feature "Check links on all pages" do
  example "Check link to Uncompleted Goals on Goals page" do
    visit "/goals"

    click_link "Uncompleted Goals"
    current_path.should == uncompleted_goals_path
  end

  example "Check link to Completed Goals on Goals page" do
    visit "/goals"
    
    click_link "Completed Goals"
    current_path.should == completed_goals_path
  end

  example "Check link to Goals page from Uncompleted Goals" do
    visit "/goals/uncompleted"
    
    click_link "All Goals"
    current_path.should == goals_path
  end

  example "Check link to Goals page from Completed Goals" do 
    visit "/goals/completed"
    
    click_link "All Goals"
    current_path.should == goals_path
  end
end
