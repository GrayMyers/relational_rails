require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit /ports/:id/ships/new' do
    describe "When I fill in the form with the ship's attributes and click the button 'Create Ship'" do
      it "Then I am redirected to the Port Ships Index page where I can see the new ship listed'" do
        la = Port.create(name: 'Los Angeles', panamax: true, dock_count: 5)

        visit "/ports/#{la.id}/ships/new"

        fill_in 'Ship Name', with: 'The Pearl'
        fill_in 'Crew Count', with: '40'
        choose 'True'

        click_on 'Create Ship'

        expect(current_path).to eql("/ports/#{la.id}/ships")
        expect(page).to have_content("The Pearl")
        expect(page).to have_content("Floating: true")
        expect(page).to have_content("Crew Count: 40")
      end
    end
  end
end
