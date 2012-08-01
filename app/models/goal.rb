class Goal < ActiveRecord::Base
  attr_accessible :completed, :name, :tasks
  has_many :tasks

  def new_tasks
    Task.where(goal_id: self.id, started: false, completed: false).all
  end

  def started_tasks
    Task.where(goal_id: self.id, started: true, completed: false).all
  end

  def completed_tasks
    Task.where(goal_id: self.id, started: true, completed: true).all
  end
end
