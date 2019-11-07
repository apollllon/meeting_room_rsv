class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :name, presence: true, length: { maximum: 140 }
  validates :start_at, presence: true, schedule_period: true
  validates :end_at, presence: true, schedule_period: true
  validates :user_id, presence: true
  validates :room_id, presence: true
end
