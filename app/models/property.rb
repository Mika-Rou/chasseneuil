class Property < ApplicationRecord
  has_many :bookings
  has_many :reviews
end
