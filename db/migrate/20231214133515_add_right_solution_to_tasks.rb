class AddRightSolutionToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :right_solution, :string
  end
end
