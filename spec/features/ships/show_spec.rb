require 'rails_helper'

describe 'As a visitor when I visit /ships/:id' do
  it "Then I see the ship with that id including the ship's attributes:" do
    visit '/ships/1'

    expect(page).to have_content("Shipwreck")
    expect(page).to have_content("Floating: false")
    expect(page).to have_content("Crew Count: 0")

    visit '/ships/2'

    expect(page).to have_content("Battleship")
    expect(page).to have_content("Floating: true")
    expect(page).to have_content("Crew Count: 1500")
  end

  describe "When I click the link 'Update Ship'" do
    it "Then I am taken to '/ships/:id/edit'" do
      la = Port.create(name: 'Los Angeles', panamax: true, dock_count: 5)
      battleship = la.ships.create(name: 'Battleship', floating: true, crew_count: 1500)

      visit "/ships/#{battleship.id}"

      click_on 'Update Ship'

      expect(current_path).to eql("/ships/#{battleship.id}/edit")
    end
  end
end
