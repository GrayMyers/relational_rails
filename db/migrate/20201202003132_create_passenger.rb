class CreatePassenger < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :name
      t.boolean :driver
      t.integer :age
      t.datetime :created_at
      t.datetime :last_updated
      t.integer :vehicle_id
    end
  end
end
