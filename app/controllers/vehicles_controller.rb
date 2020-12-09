class VehiclesController < ApplicationController
  def index
    search_param = params[:search].to_i.to_s
    search_type_param = params[:search_type] #no input sanitization yet as this parameter is harder to mess with and sanitize
    if search_type_param
      @vehicles = Vehicle.all.sort_by{ |r| -r.passengers.count}

    elsif search_param && search_param.length > 0
      @vehicles = Vehicle.order(locked: :desc, created_at: :desc).where("passenger_capacity > '#{search_param}'")
    else
      @vehicles = Vehicle.order(locked: :desc, created_at: :desc)
    end

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

end
