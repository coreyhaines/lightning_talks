class Talk < ActiveRecord::Base
  attr_accessible :title, :vote_count

  scope :sorted_by_vote_count, order("vote_count DESC")

  def add_vote!
    self.update_attribute :vote_count, self.vote_count+1
  end
end
