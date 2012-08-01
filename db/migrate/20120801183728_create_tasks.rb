class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :status, :default => "not_started"
      t.integer :goal_id

      t.timestamps
    end
  end
end
