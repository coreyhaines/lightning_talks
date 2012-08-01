class Task < ActiveRecord::Base
  attr_accessible :assignee, :description, :status

  def self.completed_tasks
    where :status => "Completed"
  end

  def self.uncompleted_tasks
    where :status => ["Not Started", "Started"]
  end
end
