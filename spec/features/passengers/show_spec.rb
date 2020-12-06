require "rails_helper"

describe "As a visitor When I visit '/child_table_name/:id'" do
  it "Then I see the child with that id including the child's attributes" do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    passenger1 = plane.passengers.create(name: "passenger 300", driver:false, age:37)

    visit "/passengers/#{passenger1.id}"
    expect(page).to have_content("passenger 300")
    expect(page).to have_content("Driver: false")
    expect(page).to have_content("Age: 37")

    expect(page).to have_link("Update Passenger")

    expect(page).to have_link("Delete Passenger")
    click_link "Delete Passenger"

    expect(current_path).to eq("/passengers/")
    expect(page).to have_no_content("passenger 300")
  end
end
