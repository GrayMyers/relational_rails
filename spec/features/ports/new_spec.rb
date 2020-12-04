require 'rails_helper'

describe "As a visitor when I visit '/parents/new'" do
  describe "When I fill out the form with a new port's attributes and click 'Create Port'" do
    it 'Then I am redirected to the Port Index page where I see the new Port displayed' do
      visit '/ports/new'

      fill_in 'Name', with: 'Port Royale'
      fill_in 'Dock Count', with: '5'
      choose 'False'

      click_on 'Create Port'

      expect(current_path).to eq("/ports")
      expect(page).to have_content('Port Royale')
    end
  end
end
