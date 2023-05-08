class User < ApplicationRecord
  has_many :solutions

  def scoreboard
    categories = Category.all
    categories.map do |category|
      [
        category.name,
        solved_count_by_category_id(category.id),
        category.tasks.count,
        position_in_rating(category.id)
      ]
    end
  end

  def solved_count_by_category_id(category_id)
    # Переписать для конкретного пользователя
    User.joins(:solutions)
        .joins('inner join tasks on solutions.task_id = tasks.id')
        .where('users.id' => id, 'tasks.category_id' => category_id)
        .select('solutions.task_id')
        .distinct
        .count
  end

  def position_in_rating(category_id)
    position = full_rating_by_category(category_id).pluck('id').index(id)
    return if position.blank?

    position + 1
  end

  private

  def full_rating_by_category(category_id)
    query = "SELECT with_task.id, count(*)
             FROM ( #{with_task_savety(category_id)} )
             AS with_task
             group by with_task.id order by count(*) desc"
    ActiveRecord::Base.connection.execute(query).to_a
  end

  def with_task_savety(category_id)
    with_task = "SELECT users.id, solutions.task_id, count(*) FROM users
                INNER JOIN solutions ON solutions.user_id = users.id
                inner join tasks on solutions.task_id = tasks.id
                where tasks.category_id = ?
                group by solutions.task_id, users.id"
    ActiveRecord::Base.sanitize_sql([with_task, category_id]) # обезопасились от инъекции
  end
end
