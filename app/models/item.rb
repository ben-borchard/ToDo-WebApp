class Item < ActiveRecord::Base
  belongs_to :user

  validates :description, presence: true
  validates :done_by, presence: true
  validate :done_by_cannot_be_in_the_past

  def done_by_cannot_be_in_the_past
    if done_by.present? && done_by < Date.today
      errors.add(:done_by, "can't be in the past")
    end
  end

end
