class Book < ActiveRecord::Base
  attr_accessible :author, :title, :votes

  def add_vote!
    self.update_attribute :votes, self.votes+1
  end

  def self.sort_by_votes
    order("votes DESC")
  end
end
