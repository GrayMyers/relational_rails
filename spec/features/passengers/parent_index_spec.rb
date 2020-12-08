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

  it "Shows a count of all children associated with parent" do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    car = Vehicle.create(name:"car", locked: true, passenger_capacity: 4)
    passenger1 = plane.passengers.create(name: "passenger 1", driver:false, age:37)
    passenger2 = plane.passengers.create(name: "passenger 2", driver:true, age:65)

    passenger3 = car.passengers.create(name: "passenger 3", driver:false, age:30)
    visit "/vehicles/#{plane.id}/passengers"
    expect(page).to have_content("Passengers: 2")

    visit "/vehicles/#{car.id}/passengers"
    expect(page).to have_content("Passengers: 1")
  end

  it "Has a link which redirects to the current page with children sorted alphabetically" do
    car = Vehicle.create(name:"car", locked: true, passenger_capacity: 4)
    passenger1 = car.passengers.create(name: "passenger A", driver:false, age:37)
    passenger2 = car.passengers.create(name: "passenger B", driver:true, age:65)
    passenger3 = car.passengers.create(name: "passenger C", driver:false, age:30)
    passenger4 = car.passengers.create(name: "passenger D", driver:false, age:28)

    visit "/vehicles/#{car.id}/passengers"

    expect(page).to have_link("Sort Passengers Alphabetically")
    click_link "Sort Passengers Alphabetically"

    expect(page.body.index("passenger A")).to be < page.body.index("passenger B")
    expect(page.body.index("passenger B")).to be < page.body.index("passenger C")
    expect(page.body.index("passenger C")).to be < page.body.index("passenger D")
  end
end
