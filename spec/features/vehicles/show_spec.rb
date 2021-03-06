require 'rails_helper'

describe 'as a visitor when I visit the page of a vehicle by id' do
  it "Then I see the parent with that id including the parent's attributes" do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    visit "/vehicles/#{plane[:id]}"
    expect(page).to have_content("Boeing 747")
    expect(page).to have_content("Locked: true")
    expect(page).to have_content("Seats: 100")
  end

  it 'Then I see a link to update the parent "Update Parent"' do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    visit "vehicles/#{plane[:id]}"
    expect(page).to have_link("Update Vehicle")
    click_link "Update Vehicle"
    expect(current_path).to eq("/vehicles/#{plane[:id]}/edit")
    expect(page).to have_content("Update")
  end

  it 'Then I see a link to delete the parent' do
    plane = Vehicle.create(name:"Boeing 767", locked: true, passenger_capacity: 100)
    visit "vehicles/#{plane[:id]}"
    expect(page).to have_link("Delete Vehicle")
    click_link "Delete Vehicle"
    expect(current_path).to eq("/vehicles/")
    expect(page).to have_no_content("767")
  end

  it "Then I see a link to take me to that vehicle's passengers page ('/vehicles/:id/passengers')" do
    plane = Vehicle.create(name:"Boeing 767", locked: true, passenger_capacity: 100)

    visit "/vehicles/#{plane.id}"

    click_on 'Vehicle Passengers'

    expect(current_path).to eql("/vehicles/#{plane.id}/passengers")
  end
end
