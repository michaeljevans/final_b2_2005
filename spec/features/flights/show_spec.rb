require 'rails_helper'

RSpec.describe 'Flight show page' do
  it 'displays flight information (number, date, time, departure city, and arrival city)' do
    frontier = Airline.create!(name: 'Frontier')
    flight_1 = Flight.create!(number: 1727, date: '2020/08/03', time: "3:30 p.m. MST", departure_city: 'Denver', arrival_city: 'Reno', airline_id: frontier.id)
    mike = Passenger.create!(name: 'Mike', age: 29)
    joe = Passenger.create!(name: 'Joe', age: 25)
    FlightPassenger.create!(flight_id: flight_1.id, passenger_id: mike.id)

    visit "/flights/#{flight_1.id}"

    expect(page).to have_content("Flight #{flight_1.number} Information")
    expect(page).to have_content("Date: #{flight_1.date}")
    expect(page).to have_content("Time: #{flight_1.time}")
    expect(page).to have_content("Departure City: #{flight_1.departure_city}")
    expect(page).to have_content("Arrival City: #{flight_1.arrival_city}")
    expect(page).to have_content(frontier.name)

    within '.passengers' do
      expect(page).to have_content(mike.name)
      expect(page).to_not have_content(joe.name)
    end
  end

  it 'displays the number of minors and adults on the flight' do
    frontier = Airline.create!(name: 'Frontier')
    flight_1 = Flight.create!(number: 1727, date: '2020/08/03', time: "3:30 p.m. MST", departure_city: 'Denver', arrival_city: 'Reno', airline_id: frontier.id)
    mike = Passenger.create!(name: 'Mike', age: 29)
    joe = Passenger.create!(name: 'Joe', age: 7)
    sally = Passenger.create!(name: 'Sally', age: 56)
    sarah = Passenger.create!(name: 'Sarah', age: 4)
    jim = Passenger.create!(name: 'Jim', age: 61)
    FlightPassenger.create!(flight_id: flight_1.id, passenger_id: mike.id)
    FlightPassenger.create!(flight_id: flight_1.id, passenger_id: joe.id)
    FlightPassenger.create!(flight_id: flight_1.id, passenger_id: sally.id)
    FlightPassenger.create!(flight_id: flight_1.id, passenger_id: sarah.id)
    FlightPassenger.create!(flight_id: flight_1.id, passenger_id: jim.id)

    visit "/flights/#{flight_1.id}"

    expect(page).to have_content('Number of Minors on Flight: 2')
    expect(page).to have_content('Number of Adults on Flight: 3')
  end
end
