class Goal < ActiveRecord::Base
  attr_accessible :description, :status

  def self.completed
    where :status => "Completed" 
  end

  def self.uncompleted
    where :status => "Not Completed"
  end
end
