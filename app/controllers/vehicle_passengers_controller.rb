class VehiclePassengersController < ApplicationController
  def index
    search_param = params[:search_type].split(" ").first if params[:search_type]
    @vehicle = Vehicle.find(params[:id])
    if search_param
      @passengers = Passenger.where(vehicle_id: @vehicle.id).order(:name)
    else
      @passengers = Passenger.where(vehicle_id: @vehicle.id)
    end
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
end
