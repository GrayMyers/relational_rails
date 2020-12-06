class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def new
    @vehicle = Vehicle.find(params[:id])
  end

  def create
    @vehicle = Vehicle.find(params[:id])
    @vehicle.passengers.create(name: params[:name], age: params[:age], driver: params[:driver])
    redirect_to "/vehicles/#{@vehicle.id}/passengers"
  end

  def edit 
    @passenger = Passenger.find(params[:id])
  end

  def update
    Passenger.find(params[:id]).update(
      name: params[:name],
      age: params[:age],
      driver: params[:driver]
    )

  end

end
