class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.order(created_at: :desc).find_all{|r| r.locked}
    @vehicles += Vehicle.order(created_at: :desc).find_all{|r| !r.locked}
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new

  end

  def create
    Vehicle.create(name:params[:name],passenger_capacity:params[:passenger_capacity],locked:params[:locked])
    redirect_to "/vehicles"
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    vehicle = Vehicle.find(params[:id])
    vehicle.update(name:params[:name],passenger_capacity:params[:passenger_capacity],locked:params[:locked])
    redirect_to "/vehicles/#{vehicle[:id]}"
  end

  def delete
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

  def passengers
    @vehicle = Vehicle.find(params[:id])
    @passengers = Passenger.where(vehicle_id: @vehicle.id)
    @passengers = [@passengers] if @passengers.class == Passenger
    @passengers ||= [] #trying to iterate on a null value will break the page

  end

end
