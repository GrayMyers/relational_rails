require 'rails_helper'

describe 'As a visitor when I visit a port edit page' do
  describe 'When I fill out the form with updated information And I click the update button' do
    it "Then I am redirected to the port's show page where I see the port's updated info" do
      la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)

      visit "/ports/#{la.id}/edit"

      fill_in 'Name', with: 'Port Royale'
      fill_in 'Dock Count', with: '3'
      choose 'False'

      click_on 'Update'

      expect(current_path).to eq("/ports/#{la.id}")
      expect(page).to have_content('Port Royale')
      expect(page).to have_content("Panamax Capable: false")
      expect(page).to have_content("Dock Count: 3")
    end
  end
end
