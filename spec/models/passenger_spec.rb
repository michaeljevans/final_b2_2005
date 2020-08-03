require 'rails_helper'

RSpec.describe Passenger do
  describe 'relationships' do
    it { should have_many :flight_passengers }
    it { should have_many(:flights).through(:flight_passengers) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_numericality_of(:age).is_greater_than(0).only_integer }
  end
end
