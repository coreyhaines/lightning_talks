class Task < ActiveRecord::Base
  belongs_to :goal
  attr_accessible :completed, :description, :name, :person, :started
end
