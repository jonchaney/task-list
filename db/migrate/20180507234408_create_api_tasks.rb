class CreateApiTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :api_tasks do |t|

      t.timestamps
    end
  end
end
