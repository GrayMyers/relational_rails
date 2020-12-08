class PassengersController < ApplicationController
  def index
    @passengers = Passenger.order(created_at: :desc).find_all{|r| r.driver}
    @passengers += Passenger.order(created_at: :desc).find_all{|r| !r.driver}
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
    passenger = Passenger.find(params[:id])
    passenger.update(
      name: params[:name],
      age: params[:age],
      driver: params[:driver]
    )
    redirect_to "/passengers/#{passenger.id}"
  end

  def delete
    passenger = Passenger.find(params[:id])
    passenger.destroy
    redirect_to "/passengers/"
  end
end
