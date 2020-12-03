# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Port.create(
  [
    {name: 'Los Angeles', panamax: true, dock_count: 5, created_at: DateTime.now, last_updated: DateTime.now},
    {name: 'New York', panamax: false, dock_count: 3, created_at: DateTime.now, last_updated: DateTime.now},
    {name: 'New Orleans', panamax: true, dock_count: 2, created_at: DateTime.now, last_updated: DateTime.now}
  ]
)

Ship.create(
  [
    {name: 'Shipwreck', floating: false, crew_count: 0, port_id:0, created_at: DateTime.now, last_updated: DateTime.now},
    {name: 'Battleship', floating: true, crew_count: 1500, port_id:0, created_at: DateTime.now, last_updated: DateTime.now},
    {name: 'Destroyer', floating: true, crew_count: 100, port_id:0, created_at: DateTime.now, last_updated: DateTime.now}
  ]
)

Vehicle.create(
  [
    {name: 'Boeing 747', locked: true, passenger_capacity: 100, created_at: DateTime.now, last_updated: DateTime.now},
    {name: 'Toyota Highlander', locked: false, passenger_capacity: 4, created_at: DateTime.now, last_updated: DateTime.now},
    {name: 'Ford Raptor', locked: true, passenger_capacity: 5, created_at: DateTime.now, last_updated: DateTime.now}
  ]
)

Passenger.create(
  [
    {name: 'Bill Fox', driver: true, age: 31, created_at: DateTime.now, last_updated: DateTime.now, vehicle_id:0},
    {name: 'Jenna Thompson', driver: false, age: 7, created_at: DateTime.now, last_updated: DateTime.now, vehicle_id:0},
    {name: 'Jane Fox', driver: false, age: 29, created_at: DateTime.now, last_updated: DateTime.now, vehicle_id:0}
  ]
)
