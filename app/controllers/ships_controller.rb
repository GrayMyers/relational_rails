class ShipsController < ApplicationController
  before_action :load_ship
  skip_before_action :load_ship, only: [:index]

  def index
    @ships = Ship.all
  end

  def show
    
  end

  def edit

  end

  def update
    @ship.update(ship_params)
    render :show
  end

  private

  def load_ship
    @ship = Ship.find(params[:id])
  end

  def ship_params
    params.permit(:name, :crew_count, :floating)
  end
end
