require "rails_helper"

describe "I  see a form to edit the parent's attributes:" do
  describe "When I fill out the form with updated information" do
    it "updates parent info and redirects" do
      plane = Vehicle.create( name:"Boeing 747", passenger_capacity: 100, locked:"false")
      
      visit "/vehicles/#{plane.id}/edit"
      expect(page).to have_content("Update Boeing 747")

      fill_in(:name, with: "Boeing 757")
      check "locked"
      fill_in(:passenger_capacity, with: 200)
      click_button "Update"

      expect(current_path).to eq("/vehicles/#{plane.id}")
      expect(page).to have_content("Boeing 757")
      expect(page).to have_content("200")
    end
  end
end
