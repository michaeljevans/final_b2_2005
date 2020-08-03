class Passenger < ApplicationRecord
  validates_presence_of :name
  validates_numericality_of :age, only_integer: true, greater_than: 0

  has_many :flight_passengers
  has_many :flights, through: :flight_passengers
end
