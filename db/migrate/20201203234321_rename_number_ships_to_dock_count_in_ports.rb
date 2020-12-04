class RenameNumberShipsToDockCountInPorts < ActiveRecord::Migration[5.2]
  def change
    rename_column :ports, :number_ships, :dock_count
  end
end
