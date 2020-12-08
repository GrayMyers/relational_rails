require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit /ports/:id/ships' do
    before :each do
      @la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)
      @battleship = @la.ships.create!(name: 'Battleship', floating: true, crew_count: 1500)
      @destroyer = @la.ships.create!(name: 'Destroyer', floating: true, crew_count: 100)

      visit "/ports/#{@la.id}/ships"
    end

    it "Then I see each ship associated with that Port including the ship's attributes" do
      expect(page).to have_content("Battleship")
      expect(page).to have_content("Floating: true")
      expect(page).to have_content("Crew Count: 1500")

      expect(page).to_not have_content("Shipwreck")
      expect(page).to_not have_content("Floating: false")
      expect(page).to_not have_content("Crew Count: 0")
    end

    it "Then I see a 'Create Ship' link that takes me to '/ports/:port_id/ships/new'" do
      expect(page).to have_link('Create Ship')

      click_link('Create Ship')

      expect(current_path).to eql("/ports/#{@la.id}/ships/new")
    end

    it 'Then I see a count of the number of Ships associated with this Port' do
      expect(page).to have_content('Ship Count: 2')

      @la.ships.create!(name: 'New Ship', floating: true, crew_count: 100)

      visit "/ports/#{@la.id}/ships"

      expect(page).to have_content('Ship Count: 3')
    end
  end
end
