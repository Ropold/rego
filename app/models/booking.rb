class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lego_set
end
