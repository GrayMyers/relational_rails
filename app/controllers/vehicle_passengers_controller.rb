class VehiclePassengersController < ApplicationController
  def index
    @vehicle = Vehicle.find(params[:id])
    @passengers = Passenger.from_vehicle(@vehicle, sanitize(params[:search_type]))
  end

  def new
    @vehicle = Vehicle.find(params[:id])
  end

  def create
    @vehicle = Vehicle.find(params[:id]) #use strong params
    @vehicle.passengers.create(passenger_params)
    redirect_to "/vehicles/#{@vehicle.id}/passengers"
  end

  private

  def passenger_params
    params.permit(:name,:age,:driver)
  end

  def sanitize(search)
    params[:search_type].split(" ").first if params[:search_type]
  end
end
