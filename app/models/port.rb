class Port < ApplicationRecord
  has_many :ships

  def ship_count
    ships.count
  end
end
