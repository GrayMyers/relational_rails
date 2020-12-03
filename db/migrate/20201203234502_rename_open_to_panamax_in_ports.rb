class RenameOpenToPanamaxInPorts < ActiveRecord::Migration[5.2]
  def change
    rename_column :ports, :open, :panamax
  end
end
