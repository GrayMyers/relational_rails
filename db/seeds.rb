# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Passenger.create(
  [
    {name: 'Bill Fox', driver: true, age: 31, created_at: DateTime.now, last_updated: DateTime.now, vehicle_id:0},
    {name: 'Jenna Thompson', driver: false, age: 7, created_at: DateTime.now, last_updated: DateTime.now, vehicle_id:0},
    {name: 'Jane Fox', driver: false, age: 29, created_at: DateTime.now, last_updated: DateTime.now, vehicle_id:0}
  ]
)
