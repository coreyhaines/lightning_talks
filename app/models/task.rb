class Task < ActiveRecord::Base
  belongs_to :goal
  attr_accessible :completed, :description, :name, :person, :started, :goal

  def start!
    update_attributes started: true
  end

  def complete!
    update_attributes completed: true
  end
end
