class AddDefaultValueToCompletedAt < ActiveRecord::Migration[5.2]
  def change

    change_column_default :tasks, :completedAt, nil

  end
end
