class LegoSet < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :photo

  validates :lego_nr, :price_per_day, numericality: true
  validates :set_name, :lego_nr, presence: true
  # validates :release_year, date: true
  #
  include PgSearch::Model

  pg_search_scope :search_by_set_name_and_lego_nr,
    against: [ :set_name, :lego_nr ],
    using: {
      tsearch: { prefix: true }
    }
end
