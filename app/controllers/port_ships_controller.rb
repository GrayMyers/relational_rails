class PortShipsController < ApplicationController
  before_action :load_port
  def index

  end

  def new

  end

  def create
    @port.ships.create(ship_params)
    redirect_to "/ports/#{@port.id}/ships"
  end

  private

  def load_port
    @port = Port.find(params[:port_id])
  end

  def ship_params
    params.permit(:name, :crew_count, :floating)
  end
end
