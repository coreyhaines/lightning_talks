require 'spec_helper'

describe Task do
  describe "initial conditions" do
    it "sets started to false" do
      t = Task.create
      t.started.should == false
    end

    it "sets completed to false" do
      t = Task.create
      t.completed.should == false
    end
  end

  describe "#start!" do
    it "sets started flag" do
      t = Task.create started: false
      t.start!
      t.reload
      t.started.should == true
    end
  end

  describe "#complete!" do
    it "sets completed flag" do
      t = Task.create completed: false
      t.complete!
      t.reload
      t.completed.should == true
    end
  end
end
