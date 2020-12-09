class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.index_display(sanitize(params[:search]),params[:search_type])
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new

  end

  def create
    Vehicle.create(vehicle_params)
    redirect_to "/vehicles"
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    vehicle = Vehicle.find(params[:id])
    vehicle.update(vehicle_params)
    redirect_to "/vehicles/#{vehicle[:id]}"
  end

  def destroy
    vehicle = Vehicle.find(params[:id])
    vehicle.destroy
    redirect_to "/vehicles/"
    passengers = Passenger.find_by(id: params[:id])
    if passengers
      passengers.each do |passenger|
        passenger.destroy
      end
    end
  end

  private

  def vehicle_params
    params.permit(:name, :passenger_capacity, :locked)
  end

  def sanitize(search_param)
    search_param.to_i.to_s
  end

end
