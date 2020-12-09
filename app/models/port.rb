class Port < ApplicationRecord
  has_many :ships

  def ship_count
    ships.count
  end

  def self.panamax_capable_at_top
    return where(panamax: :true) + where(panamax: :false)
  end
end
