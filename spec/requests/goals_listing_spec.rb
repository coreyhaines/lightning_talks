require 'spec_helper'

feature "Viewing list of goals" do
  example "No goals should display empty Goals page" do
    visit "/goals"
    all(".goals.completed.goal").should be_empty
    all(".goals.uncompleted.goal").should be_empty
  end
    
  example "One goal will show on Goals page" do
    goal = Goal.create description: "Goal 1"
    visit "/goals"
    page.should have_css(".goals.uncompleted", text: "Goal 1")
  end
  
  example "Default status of goal should be Not Completed" do
    Goal.create.status.should == "Not Completed"
  end

  example "Goals are grouped by status" do
    goal1 = Goal.create description: "Goal 1"
    goal2 = Goal.create description: "Goal 2"
    goal3 = Goal.create description: "Goal 3"

    goal1.update_attribute :status, "Completed"

    visit "/goals"

    within(".goals.uncompleted") do
      find("#goal_#{goal2.id}")
      find("#goal_#{goal3.id}")
    end
  
    within(".goals.completed") do
      find("#goal_#{goal1.id}")
    end

  end
end

