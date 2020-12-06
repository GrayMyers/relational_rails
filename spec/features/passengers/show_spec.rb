require "rails_helper"

describe "As a visitor When I visit '/child_table_name/:id'" do
  it "Then I see the child with that id including the child's attributes" do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    passenger1 = plane.passengers.create(name: "passenger 1", driver:false, age:37)

    visit "/passengers/#{passenger1.id}"
    expect(page).to have_content("passenger 1")
    expect(page).to have_content("Driver: false")
    expect(page).to have_content("Age: 37")

    expect(page).to have_link("Update Passenger")
  end
end
