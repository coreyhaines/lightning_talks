class Goal < ActiveRecord::Base
  attr_accessible :name, :project_id

  belongs_to :project
  has_many :tasks, :dependent => :delete_all
end
