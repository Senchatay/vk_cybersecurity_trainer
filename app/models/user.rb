class User < ApplicationRecord
  include RatingHelper

  has_many :solutions

  def scoreboard(ratings)
    categories = Category.all
    categories.map do |category|
      [
        category.name,
        solved_count_by_category_id(category.id),
        category.tasks.count,
        position_in_rating(ratings[category.id])
      ]
    end
  end

  private

  def solved_count_by_category_id(category_id)
    solutions.joins('inner join tasks on solutions.task_id = tasks.id')
             .where('tasks.category_id' => category_id)
             .select('solutions.task_id')
             .distinct
             .count
  end

  def position_in_rating(rating)
    position = rating.pluck('id').index(id)
    return if position.blank?

    position + 1
  end
end
