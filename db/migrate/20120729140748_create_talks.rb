class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title

      t.timestamps
    end
  end
end
