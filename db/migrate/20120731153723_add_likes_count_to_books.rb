class AddLikesCountToBooks < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.integer :likes_count, :default => 0
    end
  end
end
