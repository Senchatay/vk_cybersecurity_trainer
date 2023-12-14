class AddStatusToSolutions < ActiveRecord::Migration[7.0]
  def change
    add_column :solutions, :status, :string, default: Solution::STATUSES[:not_checked]
  end
end
