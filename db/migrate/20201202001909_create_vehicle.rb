class CreateVehicle < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.boolean :locked
      t.integer :passenger_capacity
      t.datetime :created_at
      t.datetime :last_updated
    end
  end
end
