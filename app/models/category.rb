class Category < ApplicationRecord
  has_many :tasks
  validates :name, presence: true, uniqueness: true

  def self.all_ids
    Category.pluck(:id)
  end

  def self.tasks_count_by_id(*ids)
    ids.map do |id|
      category = Category.find(id)
      [category.name, category.tasks.count]
    end
  end
end
