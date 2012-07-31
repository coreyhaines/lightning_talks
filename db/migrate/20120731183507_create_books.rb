class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :votes
      :default => 0 

      t.timestamps
    end
  end
end
