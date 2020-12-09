class Port < ApplicationRecord
  has_many :ships

  def self.panamax_capable_at_top
    where(panamax: :true) + where(panamax: :false)
  end

  def self.ports_with_dock_count_greater_than(dock_count_threshold)
    where("dock_count > ?", dock_count_threshold)
  end

  def self.sort_ports_by_ship_count
    all.sort_by do |port|
      -port.ships.count
    end
  end

  def ship_count
    ships.count
  end

  def ships_sorted_by_name_alphabetically
    ships.order(:name)
  end
end
