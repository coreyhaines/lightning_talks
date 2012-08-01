class Project < ActiveRecord::Base
  attr_accessible :name

  has_many :goals, :dependent => :delete_all
end
