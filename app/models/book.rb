class Book < ActiveRecord::Base
  attr_accessible :author, :title, :votes

  def add_vote!
    update_attribute :votes, self.votes+1
  end
end
