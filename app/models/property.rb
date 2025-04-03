class Property < ApplicationRecord
  has_many :bookings
  has_many :reviews
  has_one_attached :photo
end
