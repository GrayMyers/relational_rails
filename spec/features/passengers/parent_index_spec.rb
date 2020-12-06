require "rails_helper"
describe "As a visitor when I visit '/parents/:parent_id/child_table_name'" do
  it "I see each Child that is associated with that Parent with each Child's attributes" do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    car = Vehicle.create(name:"car", locked: true, passenger_capacity: 4)
    passenger1 = plane.passengers.create(name: "passenger 1", driver:false, age:37)
    passenger2 = plane.passengers.create(name: "passenger 2", driver:true, age:65)

    passenger3 = car.passengers.create(name: "passenger 3", driver:false, age:30)
    visit "/vehicles/#{plane.id}/passengers"
    expect(page).to have_content("passenger 1")
    expect(page).to have_content("Driver: false")
    expect(page).to have_content("Age: 37")

    expect(page).to have_content("passenger 2")
    expect(page).to have_content("Driver: true")
    expect(page).to have_content("Age: 65")

    expect(page).to have_no_content("passenger 3")
    expect(page).to have_no_content("Age: 30")
  end
end
