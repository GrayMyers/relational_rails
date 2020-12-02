# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Port.create(
  [
    {name: 'Los Angeles', open: true, number_ships: 5, created_at: DateTime.now, last_updated: DateTime.now},
    {name: 'New York', open: false, number_ships: 3, created_at: DateTime.now, last_updated: DateTime.now},
    {name: 'New Orleans', open: true, number_ships: 2, created_at: DateTime.now, last_updated: DateTime.now}
  ]
)

Vehicle.create(
  [
    {name: 'Boeing 747', locked: true, passenger_capacity: 100, created_at: DateTime.now, last_updated: DateTime.now},
    {name: 'Toyota Highlander', locked: false, passenger_capacity: 4, created_at: DateTime.now, last_updated: DateTime.now},
    {name: 'Ford Raptor', locked: true, passenger_capacity: 5, created_at: DateTime.now, last_updated: DateTime.now}
  ]
)

# Ship.create(
#   [
#     {name: 'Los Angeles', floating: true, crew_count: 5, port_id:0, created_at: DateTime.now, last_updated: DateTime.now},
#     {name: 'New York', open: false, number_ships: 3, port_id:0, created_at: DateTime.now, last_updated: DateTime.now},
#     {name: 'New Orleans', open: true, number_ships: 2, port_id:0, created_at: DateTime.now, last_updated: DateTime.now}
#   ]
# )
