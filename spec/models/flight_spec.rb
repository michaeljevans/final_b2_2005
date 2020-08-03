require 'rails_helper'

RSpec.describe Flight do
  describe 'relationships' do
    it { should belong_to :airline }
    it { should have_many :flight_passengers }
    it { should have_many(:passengers).through(:flight_passengers) }
  end

  describe 'validations' do
    it { should validate_numericality_of(:number).only_integer }
    it { should validate_presence_of :time }
    it { should validate_presence_of :date }
    it { should validate_presence_of :departure_city }
    it { should validate_presence_of :arrival_city }
  end

  describe 'instance methods' do
    it '#minors_on_board' do
      frontier = Airline.create!(name: 'Frontier')
      flight_1 = Flight.create!(number: 1727, date: '2020/08/03', time: "3:30 p.m. MST", departure_city: 'Denver', arrival_city: 'Reno', airline_id: frontier.id)
      mike = Passenger.create!(name: 'Mike', age: 29)
      joe = Passenger.create!(name: 'Joe', age: 7)
      sarah = Passenger.create!(name: 'Sarah', age: 4)
      FlightPassenger.create!(flight_id: flight_1.id, passenger_id: mike.id)
      FlightPassenger.create!(flight_id: flight_1.id, passenger_id: joe.id)
      FlightPassenger.create!(flight_id: flight_1.id, passenger_id: sarah.id)

      expect(flight_1.minors_on_board).to eq(2)
    end

    it '#adults_on_board' do
      frontier = Airline.create!(name: 'Frontier')
      flight_1 = Flight.create!(number: 1727, date: '2020/08/03', time: "3:30 p.m. MST", departure_city: 'Denver', arrival_city: 'Reno', airline_id: frontier.id)
      mike = Passenger.create!(name: 'Mike', age: 29)
      joe = Passenger.create!(name: 'Joe', age: 7)
      sally = Passenger.create!(name: 'Sally', age: 56)
      jim = Passenger.create!(name: 'Jim', age: 61)
      FlightPassenger.create!(flight_id: flight_1.id, passenger_id: mike.id)
      FlightPassenger.create!(flight_id: flight_1.id, passenger_id: joe.id)
      FlightPassenger.create!(flight_id: flight_1.id, passenger_id: sally.id)
      FlightPassenger.create!(flight_id: flight_1.id, passenger_id: jim.id)

      expect(flight_1.adults_on_board).to eq(3)
    end
  end
end
