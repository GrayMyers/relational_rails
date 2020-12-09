class PassengersController < ApplicationController
  def index
    @passengers = Passenger.index_display(sanitize(params[:search]))
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    passenger = Passenger.find(params[:id])
    passenger.update(passenger_params)
    redirect_to "/passengers/#{passenger.id}"
  end

  def destroy
    passenger = Passenger.find(params[:id])
    passenger.destroy
    redirect_to "/passengers/"
  end

  private

  def passenger_params
    params.permit(:name,:age,:driver)
  end

  def sanitize(search)
    search.to_i.to_s
  end

end
