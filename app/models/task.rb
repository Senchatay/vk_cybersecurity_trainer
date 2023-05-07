class Task < ApplicationRecord
  belongs_to :category
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true

  def category_name
    category&.name
  end
end
