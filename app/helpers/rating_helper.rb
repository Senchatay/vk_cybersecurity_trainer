module RatingHelper
  def all_ratings
    Category.pluck(:id).map { |id| [id, full_rating_by_category(id)] }.to_h
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
