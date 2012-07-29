class Talk < ActiveRecord::Base
  attr_accessible :title, :vote_count

  def add_vote!
    self.update_attribute :vote_count, self.vote_count+1
  end
end
