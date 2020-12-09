class Passenger < ApplicationRecord
  belongs_to :vehicle

  def self.from_vehicle(vehicle,search_param)
    if search_param
      Passenger.where(vehicle_id: vehicle.id).order(:name)
    else
      Passenger.where(vehicle_id: vehicle.id)
    end
  end

  def self.index_display(search_param)
    if search_param && search_param.length > 0
      Passenger.order(driver: :desc, created_at: :desc).where("age > '#{search_param}'")
    else
      Passenger.order(driver: :desc, created_at: :desc)
    end
  end
end
