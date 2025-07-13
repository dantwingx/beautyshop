class TimeSlot < ApplicationRecord
  belongs_to :stylist
  
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :is_available, inclusion: { in: [true, false] }
  
  scope :available, -> { where(is_available: true) }
  scope :for_date, ->(date) { where(date: date) }
  scope :ordered, -> { order(:start_time) }
end
