require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit /ships' do
    before :each do
      @la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5, created_at: 'Mon, 07 Dec 2020 01:00:00 UTC +00:00')
      @wreck = @la.ships.create!(name: 'Shipwreck', floating: false, crew_count: 0, created_at: 'Tues, 08 Dec 2020 01:00:00 UTC +00:00')
      @battleship = @la.ships.create!(name: 'Battleship', floating: true, crew_count: 1500, created_at: 'Thurs, 10 Dec 2020 01:00:00 UTC +00:00')
      @destroyer = @la.ships.create!(name: 'Destroyer', floating: true, crew_count: 100, created_at: 'Weds, 9 Dec 2020 01:00:00 UTC +00:00')

      visit '/ships'
    end

    it "Then I see each ship in the system including the ship's attributes" do
      expect(page).to have_content(@wreck.name)
      expect(page).to have_content("Floating: #{@wreck.floating}")
      expect(page).to have_content("Crew Count: #{@wreck.crew_count}")

      expect(page).to have_content(@battleship.name)
      expect(page).to have_content("Floating: #{@battleship.floating}")
      expect(page).to have_content("Crew Count: #{@battleship.crew_count}")
    end

    it 'I see the DateTime(s) next to each of the records in a reasonably formatted manner' do
      within(".ship-#{@battleship.id}") do
        expect(page).to have_content("Created on 12/10/2020")
      end

      within(".ship-#{@wreck.id}") do
        expect(page).to have_content("Created on 12/08/2020")
      end
    end

    it 'I see the records that have floating: `true` above/before the records that have a false' do
      expect(@battleship.name).to appear_before(@wreck.name)
    end

    describe 'I see a form that allows me to input a number value' do
      describe 'When I input a number value and click the submit button' do
        it 'The ships index page renders only ships with crew_counts greater than the input number value' do
          fill_in 'crew_count_limit', with: '20'

          click_on 'Only return ships with more crew than the given `Crew Count Threshold Number`'

          expect(page).to have_content(@battleship.name)
          expect(page).to have_content(@destroyer.name)
          expect(page).to_not have_content(@wreck.name)
        end
      end
    end
  end
end
