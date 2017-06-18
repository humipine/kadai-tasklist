class AddStatusToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :status, :string, limit:10
  end
end
