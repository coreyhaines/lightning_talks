class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :assignee
      t.string :description
      t.string :status, :default => "Not Started"

      t.timestamps
    end
  end
end
