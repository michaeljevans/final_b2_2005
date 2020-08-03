class Flight < ApplicationRecord
  validates_numericality_of :number, only_integer: true
  validates_presence_of :date, :time, :departure_city, :arrival_city

  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers
end
