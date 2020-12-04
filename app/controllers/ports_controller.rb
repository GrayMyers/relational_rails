class PortsController < ApplicationController
  def index
    @ports = Port.all
  end

  def show
    @port = Port.find(params[:id])
  end

  def new
    @port = Port.new
  end

  def create
    Port.create(port_params)
    redirect_to '/ports'
  end

  private

  def port_params
    params.require(:port).permit(:name, :dock_count, :panamax)
  end
end
