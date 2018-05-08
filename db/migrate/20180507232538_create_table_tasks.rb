class CreateTableTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.date :completedAt, default: nil
    end
  end
end
