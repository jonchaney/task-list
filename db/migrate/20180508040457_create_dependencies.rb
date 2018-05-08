class CreateDependencies < ActiveRecord::Migration[5.2]
  def change
    create_table :dependencies do |t|
      t.integer :task_id, null: false
      t.integer :dependency_id, null: false
    end
  end
end
