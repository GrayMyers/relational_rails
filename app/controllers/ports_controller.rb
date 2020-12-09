class PortsController < ApplicationController
  before_action :load_port
  skip_before_action :load_port, only: [:index, :new, :create]

  def index
    if (params[:dock_count_limit])
      @ports = Port.ports_with_dock_count_greater_than(params[:dock_count_limit])
    elsif (params[:sort_by_ships])
      @ports = Port.sort_ports_by_ship_count
    else
      @ports = Port.all.recent_at_top.panamax_capable_at_top
    end
  end

  def show
  end

  def new
    @port = Port.new
  end

  def create
    Port.create(port_params)
    redirect_to '/ports'
  end

  def edit
  end

  def update
    @port.update(port_params)
    render :show
  end

  def delete
    @port.destroy
    redirect_to '/ports'
  end

  private

  def load_port
    @port = Port.find(params[:id])
  end

  def port_params
    params.permit(:name, :dock_count, :panamax)
  end
end
