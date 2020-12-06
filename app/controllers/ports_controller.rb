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

  def edit
    @port = Port.find(params[:id])
  end

  def update
    @port = Port.find(params[:id])
    @port.update(port_params)
    render :show
  end

  private

  def port_params
    params.permit(:name, :dock_count, :panamax)
  end
end
