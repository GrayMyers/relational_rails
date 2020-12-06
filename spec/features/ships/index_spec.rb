require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit /ships' do
    it "Then I see each ship in the system including the ship's attributes" do
      wreck = Ship.create(name: 'Shipwreck', floating: false, crew_count: 0)
      battleship = Ship.create(name: 'Battleship', floating: true, crew_count: 1500)
      destroyer = Ship.create(name: 'Destroyer', floating: true, crew_count: 100)

      visit '/ships'

      expect(page).to have_content("Shipwreck")
      expect(page).to have_content("Floating: false")
      expect(page).to have_content("Crew Count: 0")

      expect(page).to have_content("Battleship")
      expect(page).to have_content("Floating: true")
      expect(page).to have_content("Crew Count: 1500")
    end
  end
end
