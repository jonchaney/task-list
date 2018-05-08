class ChangeCompletedAtName < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :completedAt, :completed_at
  end
end
