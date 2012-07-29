class AddVoteCountToTalk < ActiveRecord::Migration
  def change
    add_column :talks, :vote_count, :integer, :default => 0
  end
end
