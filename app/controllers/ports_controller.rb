class PortsController < ApplicationController
  def index
    @ports = Port.all
  end

  def show
    @port = Port.find(params[:id])
  end
end
