class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lego_set

  validates :rent_start, :rent_end, presence: true
end
