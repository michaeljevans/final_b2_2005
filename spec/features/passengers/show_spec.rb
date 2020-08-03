require 'rails_helper'

RSpec.describe 'Passenger show page' do
  it 'displays passenger information and flights as links' do
    frontier = Airline.create!(name: 'Frontier')
    flight_1 = Flight.create!(number: 1727, date: '2020/08/03', time: "3:30 p.m. MST", departure_city: 'Denver', arrival_city: 'Reno', airline_id: frontier.id)
    flight_2 = Flight.create!(number: 747, date: '2020/08/09', time: "1:30 p.m. MST", departure_city: 'Reno', arrival_city: 'Denver', airline_id: frontier.id)
    joe = Passenger.create!(name: 'Joe', age: 25)

    visit "/passengers/#{joe.id}"

    expect(page).to have_content(joe.name)

    within '.flights' do
      expect(page).to have_content("Flight #{flight_1.number}")
      expect(page).to have_content("Flight #{flight_2.number}")
      expect(page).to have_link(flight_1.number)
      expect(page).to have_link(flight_2.number)
      click_link flight_1.number
    end

    expect(current_path).to eq("/flights/#{flight_1.id}")
  end
end
