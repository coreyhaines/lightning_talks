class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :person
      t.references :goal
      t.boolean :started, :default => false
      t.boolean :completed, :default => false

      t.timestamps
    end
    add_index :tasks, :goal_id
  end
end
