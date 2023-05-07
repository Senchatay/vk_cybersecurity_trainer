class Solution < ApplicationRecord
  belongs_to :user
  belongs_to :task
  validates :user, presence: true
  validates :task, presence: true

  def user_name
    user.name
  end

  def task_name
    task.name
  end
end
