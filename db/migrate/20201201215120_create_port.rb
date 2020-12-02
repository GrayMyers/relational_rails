class CreatePort < ActiveRecord::Migration[5.2]
  def change
    create_table :ports do |t|
      t.string :name
      t.boolean :open
      t.integer :number_ships
      t.datetime :created_at
      t.datetime :last_updated
    end
  end
end
