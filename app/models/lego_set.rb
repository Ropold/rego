class LegoSet < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :lego_nr, :price_per_day, numericality: true
  validates :set_name, :lego_nr, presence: true
  # validates :release_year, date: true
end
