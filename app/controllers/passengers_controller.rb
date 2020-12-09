class PassengersController < ApplicationController
  def index
    search_param = params[:search].to_i.to_s #input sanitizing
    if search_param && search_param.length > 0
      @passengers = Passenger.order(driver: :desc, created_at: :desc).where("age > '#{search_param}'")
    else
      @passengers = Passenger.order(driver: :desc, created_at: :desc)
    end
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

end
