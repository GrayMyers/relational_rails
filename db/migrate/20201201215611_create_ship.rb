class CreateShip < ActiveRecord::Migration[5.2]
  def change
    create_table :ships do |t|
      t.string :name
      t.boolean :floating
      t.integer :crew_count
      t.datetime :created_at
      t.datetime :last_updated
      t.integer :port_id
    end
  end
end
