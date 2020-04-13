class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :name
      t.string :description
      t.integer :effort
      t.integer :value
      t.integer :sprint_id
      t.integer :goal_id

      t.timestamps
    end
  end
end
