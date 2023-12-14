# frozen_string_literal: true

class Solution < ApplicationRecord
  belongs_to :user
  belongs_to :task
  validates :user, presence: true
  validates :task, presence: true

  STATUSES = { right: 'Верно', wrong: 'Неверно', not_checked: 'Не проверено' }.freeze
  STATUSES_COLOR = { right: :green, wrong: :red, not_checked: :orange }.freeze

  def user_name
    user.name
  end

  def set_right!
    update(status: STATUSES[:right])
  end

  def set_wrong!
    update(status: STATUSES[:wrong])
  end

  def decorized_status
    color = STATUSES_COLOR[STATUSES.key(status)]

    "<a style=\"color: #{color}\">#{status}</a>".html_safe
  end
end
