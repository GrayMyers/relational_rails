require 'rails_helper'

describe 'As a visitor when I visit /ships/:id' do
  it "Then I see the ship with that id including the ship's attributes:" do
    la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)
    shipwreck = la.ships.create!(name: 'Shipwreck', floating: false, crew_count: 0)
    battleship = la.ships.create!(name: 'Battleship', floating: true, crew_count: 1500)

    visit "/ships/#{shipwreck.id}"

    expect(page).to have_content("Shipwreck")
    expect(page).to have_content("Floating: false")
    expect(page).to have_content("Crew Count: 0")

    visit "/ships/#{battleship.id}"

    expect(page).to have_content("Battleship")
    expect(page).to have_content("Floating: true")
    expect(page).to have_content("Crew Count: 1500")
  end

  describe "When I click the link 'Update Ship'" do
    it "Then I am taken to '/ships/:id/edit'" do
      la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)
      battleship = la.ships.create!(name: 'Battleship', floating: true, crew_count: 1500)

      visit "/ships/#{battleship.id}"

      click_on 'Update Ship'

      expect(current_path).to eql("/ships/#{battleship.id}/edit")
    end
  end

  describe "When I click the link 'Delete Ship'" do
    it "I am redirected to '/ships' where I no longer see the ship" do
      la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)
      battleship = la.ships.create!(name: 'Battleship', floating: true, crew_count: 1500)

      visit "/ships/#{battleship.id}"

      click_on 'Delete Ship'

      expect(current_path).to eql("/ships")
      expect(page).to_not have_content('Battleship')
    end
  end
end
