class Task < ActiveRecord::Base
  attr_accessible :goal_id, :name, :status

  belongs_to :goal
end
