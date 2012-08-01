class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :description
      t.string :status, :default => "Not Completed"

      t.timestamps
    end
  end
end
