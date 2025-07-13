class User < ApplicationRecord
  has_secure_password validations: false
  
  has_many :bookings, dependent: :destroy
  
  enum :role, { customer: 0, shop_owner: 1, admin: 2 }
  
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :phone, presence: true, unless: :social_login?
  validates :password, presence: true, length: { minimum: 6 }, unless: :social_login?
  
  def social_login?
    provider.present? && uid.present?
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.phone = auth.info.phone || "010-0000-0000"
      user.password = SecureRandom.hex(16) if user.new_record?
    end
  end
end
