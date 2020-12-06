require "rails_helper"

describe "As a visitor when I visit a Parent Childs Index page" do
  it "Then I see a link to add a new adoptable child for that parent" do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    visit "/vehicles/#{plane.id}/passengers"

    expect(page).to have_link("Create Passenger")
    click_link "Create Passenger"
    expect(current_path).to eq("/vehicles/#{plane.id}/passengers/new")

    fill_in(:name, with: "a new passenger")
    check "driver"
    fill_in(:age, with: 5)
    click_button "Create"

    expect(current_path).to eq("/vehicles/#{plane.id}/passengers")
    expect(page).to have_content("a new passenger")
  end
