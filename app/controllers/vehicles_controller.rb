class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
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

end
