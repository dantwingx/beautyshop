class Shop < ApplicationRecord
  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :stylists, dependent: :destroy
  
  enum :category, { hair_salon: 0, beauty_shop: 1, gym: 2, pilates: 3 }
  
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :category, presence: true
  
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  scope :nearby, ->(latitude, longitude, distance = 5) {
    near([latitude, longitude], distance, units: :km)
  }
end
