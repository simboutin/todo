class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validate :due_date_greater_than_yesterday

  default_scope { order(:done).order(:due_date) }

  def due_date_greater_than_yesterday
    return unless due_date.present? && due_date.past?

    errors.add(:due_date, "can't be in the past")
  end
end
