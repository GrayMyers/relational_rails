require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit /ports/:id/ships' do
    it "Then I see each ship associated with that Port including the ship's attributes" do
      la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)
      battleship = la.ships.create!(name: 'Battleship', floating: true, crew_count: 1500)

      visit "/ports/#{la.id}/ships"

      expect(page).to have_content("Battleship")
      expect(page).to have_content("Floating: true")
      expect(page).to have_content("Crew Count: 1500")

      expect(page).to_not have_content("Shipwreck")
      expect(page).to_not have_content("Floating: false")
      expect(page).to_not have_content("Crew Count: 0")
    end

    it "Then I see a 'Create Ship' link that takes me to '/ports/:port_id/ships/new'" do
      la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)

      visit "/ports/#{la.id}/ships"

      expect(page).to have_link('Create Ship')

      click_link('Create Ship')

      expect(current_path).to eql("/ports/#{la.id}/ships/new")
    end
  end
end
