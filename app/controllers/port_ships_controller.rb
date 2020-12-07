class PortShipsController < ApplicationController
  def index
    @port = Port.find(params[:port_id])
    @ships = @port.ships
  end
end
