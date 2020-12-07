require 'rails_helper'

describe 'As a visitor when I visit /ships/:id/edit' do
  describe 'When I fill out the form and click the Update Ship button' do
    it "Then I am redirected to the Ship Show page where I see the Ship's updated information" do
      la = Port.create(name: 'Los Angeles', panamax: true, dock_count: 5)
      battleship = la.ships.create(name: 'Battleship', floating: true, crew_count: 1500)

      visit "/ships/#{battleship.id}/edit"

      fill_in 'Ship Name', with: 'The Pearl'
      fill_in 'Crew Count', with: '40'
      choose 'False'

      click_on 'Update Ship'

      expect(current_path).to eql("/ships/#{battleship.id}")

      expect(page).to_not have_content("Battleship")
      expect(page).to_not have_content("Floating: true")
      expect(page).to_not have_content("Crew Count: 1500")

      expect(page).to have_content("The Pearl")
      expect(page).to have_content("Floating: false")
      expect(page).to have_content("Crew Count: 40")
    end
  end
end
