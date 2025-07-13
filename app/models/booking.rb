class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :service
  belongs_to :stylist, optional: true
  
  enum :status, { pending: 0, confirmed: 1, cancelled: 2, completed: 3 }
  
  validates :booking_date, presence: true
  validates :booking_time, presence: true
  validates :status, presence: true
  
  validate :booking_date_must_be_future
  
  before_save :calculate_total_price
  
  private
  
  def booking_date_must_be_future
    return unless booking_date.present?
    errors.add(:booking_date, "must be in the future") if booking_date < Date.today
  end
  
  def calculate_total_price
    self.total_price = service.price if service.present?
  end
end
