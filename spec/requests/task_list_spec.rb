require 'spec_helper'

def prep
  goal = Goal.create name: "Money"
  visit "/goals/#{goal.id}/tasks"
  return goal
end

describe "List of Tasks" do
  example "no tasks gives empty page" do
    goal = prep
    all(".task").should be_empty
  end

  example "one task shows up" do
    goal = prep
    task = Task.create name: "work", goal: goal
    visit "/goals/#{goal.id}/tasks"
    find("#task_#{task.id}").text.should =~ /work/
  end

  example "all tasks show up" do
    goal = prep
    task1 = Task.create name: "fake", goal: goal
    task2 = Task.create name: "names", goal: goal
    visit "/goals/#{goal.id}/tasks"
    find("#task_#{task1.id}").text.should =~ /fake/
    find("#task_#{task2.id}").text.should =~ /names/
  end
end
