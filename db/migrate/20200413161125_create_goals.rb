class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.integer :project_id
      t.integer :sprint_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
