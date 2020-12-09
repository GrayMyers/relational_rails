class Vehicle < ApplicationRecord
  has_many :passengers

  def self.index_display(search_param,search_type_param)
    if search_type_param
      Vehicle.all.sort_by{ |r| -r.passengers.count}
    elsif search_param && search_param.length > 0
      Vehicle.order(locked: :desc, created_at: :desc).where("passenger_capacity > '#{search_param}'")
    else
      Vehicle.order(locked: :desc, created_at: :desc)
    end
  end
end
