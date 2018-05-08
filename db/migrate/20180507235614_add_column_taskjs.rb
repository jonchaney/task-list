class AddColumnTaskjs < ActiveRecord::Migration[5.2]
  def change
    drop_table :api_tasks
  end
end
