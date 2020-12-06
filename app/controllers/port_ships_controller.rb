class PortShipsController < ApplicationController
  def index
    @port = Port.find(params[:port_id])
  end

  def new

  end
end
