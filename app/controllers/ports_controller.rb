class PortsController < ApplicationController
  before_action :load_port
  skip_before_action :load_port, only: [:index, :new, :create]

  def index
    @ports = Port.sorted_recent_at_top
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
