class VehiclesAddTimestamps < ActiveRecord::Migration[5.2]
  def change
    remove_column :vehicles, :last_updated
    add_column :vehicles, :updated_at, :datetime
  end
end
