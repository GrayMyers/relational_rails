require "rails_helper"

describe "As a visitor when I visit a Child Show page" do
    it "I see a link to update that Child 'Update Child'" do
    plane = Vehicle.create( name:"Boeing 747", passenger_capacity: 100, locked:"false")
    passenger = plane.Passenger.create(name:"pass 1",driver:false,age:7)
    visit "/passengers/#{passenger.id}/edit"
    expect(page).to have_content("Update pass 1")

    fill_in(:name, with: "slightly older pass 1")
    fill_in(:passenger_capacity, with: 8)
    click_button "Update"

    expect(current_path).to eq("/passengers/#{passenger.id}")
    expect(page).to have_content("slightly older pass 1")
    expect(page).to have_content("8")
  end
end
