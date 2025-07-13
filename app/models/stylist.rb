class Stylist < ApplicationRecord
  belongs_to :shop
  has_many :bookings, dependent: :destroy
  has_many :time_slots, dependent: :destroy
  
  validates :name, presence: true
  validates :experience_years, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { in: 0.0..5.0 }, allow_nil: true
  
  scope :available_on, ->(date) {
    joins(:time_slots).where(time_slots: { date: date, is_available: true }).distinct
  }
  
  def available_times_on(date)
    time_slots.where(date: date, is_available: true).order(:start_time)
  end
  
  def generate_time_slots_for_date(date)
    return if time_slots.exists?(date: date)
    
    # 9시부터 18시까지 1시간 간격으로 슬롯 생성
    (9..17).each do |hour|
      time_slots.create!(
        date: date,
        start_time: Time.parse("#{hour}:00"),
        end_time: Time.parse("#{hour + 1}:00"),
        is_available: true
      )
    end
  end
end
