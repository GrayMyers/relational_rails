require 'rails_helper'

describe 'as a visitor when I visit the page of a vehicle by id' do
  it "Then I see the parent with that id including the parent's attributes" do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    visit "/vehicles/#{plane[:id]}"
    expect(page).to have_content("Boeing 747")
    expect(page).to have_content("Locked: true")
    expect(page).to have_content("Seats: 100")
  end
end
