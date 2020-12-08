class VehiclesController < ApplicationController
  def index
    search_param = params[:search].to_i.to_s
    search_type_param = params[:search_type] #no input sanitization yet as this parameter is harder to mess with and sanitize
    if search_type_param
      @vehicles = Vehicle.all.sort_by{ |r| -r.passengers.count}

    elsif search_param && search_param.length > 0
      @vehicles = Vehicle.order(created_at: :desc).where("locked = 'true'").where("passenger_capacity > '#{search_param}'")
      @vehicles += Vehicle.order(created_at: :desc).where("locked = 'false'").where("passenger_capacity > '#{search_param}'")
    else
      @vehicles = Vehicle.order(created_at: :desc).where("locked = 'true'")
      @vehicles += Vehicle.order(created_at: :desc).where("locked = 'false'")
    end

  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new

  end

  def create
    Vehicle.create(name:params[:name],passenger_capacity:params[:passenger_capacity],locked:params[:locked])
    redirect_to "/vehicles"
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    vehicle = Vehicle.find(params[:id])
    vehicle.update(name:params[:name],passenger_capacity:params[:passenger_capacity],locked:params[:locked])
    redirect_to "/vehicles/#{vehicle[:id]}"
  end

  def delete
    vehicle = Vehicle.find(params[:id])
    vehicle.destroy
    redirect_to "/vehicles/"
    passengers = Passenger.find_by(id: params[:id])
    if passengers
      passengers.each do |passenger|
        passenger.destroy
      end
    end
  end

  def passengers
    search_param = params[:search_type].split(" ").first if params[:search_type]
    @vehicle = Vehicle.find(params[:id])
    if search_param
      @passengers = Passenger.where(vehicle_id: @vehicle.id).order(:name)
    else
      @passengers = Passenger.where(vehicle_id: @vehicle.id)
    end
  end

end
