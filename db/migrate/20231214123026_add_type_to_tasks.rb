class AddTypeToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :solution_type, :string, default: Task::TYPES[:manual]
  end
end
