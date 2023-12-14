# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :solutions
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true

  TYPES = { auto: 'С автоматическим тестированием', manual: 'С ручным тестированием' }.freeze

  def category_name
    category&.name
  end

  def auto?
    @auto ||= solution_type == TYPES[:auto]
  end
end
