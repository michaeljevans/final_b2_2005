class FlightPassengersController < ApplicationController
  def create
    flight_passenger = FlightPassenger.new(flight_passenger_params)
    redirect_to "/passengers/#{params[:passenger_id]}" if flight_passenger.save
  end

  private

  def flight_passenger_params
    params.permit(:flight_id, :passenger_id)
  end
end
