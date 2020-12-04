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

end
