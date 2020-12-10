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

    it 'Then I see a link to sort ships in alphabetical order' do
      expect(page).to have_link('Sort Ships Alphabetically')
    end

    describe "When I click on the 'Sort Ships Alphabetically' link" do
      it 'I see all of the ships in alphabetical order' do
        @ship_c = @la.ships.create!(name: 'c ship', floating: true, crew_count: 100)
        @ship_b = @la.ships.create!(name: 'b ship', floating: true, crew_count: 100)
        @ship_a = @la.ships.create!(name: 'a ship', floating: true, crew_count: 100)

        visit "/ports/#{@la.id}/ships"

        click_link('Sort Ships Alphabetically')

        expect(@ship_a.name).to appear_before(@ship_b.name)
        expect(@ship_b.name).to appear_before(@ship_c.name)
        expect(@battleship.name).to appear_before(@destroyer.name)
      end
    end

    it "I see a link to 'Update Ship' next to each Ship" do
      within ".ship-#{@battleship.id}" do
        expect(page).to have_link('Update Ship', href: "/ships/#{@battleship.id}/edit")
      end

      within ".ship-#{@destroyer.id}" do
        expect(page).to have_link('Update Ship', href: "/ships/#{@destroyer.id}/edit")
      end
    end

    describe "When I click the link 'Update Ship'" do
      it "Then I am taken to '/ships/:id/edit'" do
        find(".update-ship-#{@battleship.id}").click

        expect(current_path).to eql("/ships/#{@battleship.id}/edit")
      end
    end

    it "I see a link to 'Delete Ship' next to each Ship" do
      within ".ship-#{@battleship.id}" do
        expect(page).to have_link('Delete Ship', href: "/ships/#{@battleship.id}")
      end

      within ".ship-#{@destroyer.id}" do
        expect(page).to have_link('Delete Ship', href: "/ships/#{@destroyer.id}")
      end
    end

    it "Has a link for the parent" do
      expect(page).to have_link(@la.name)
      click_on @la.name
      expect(current_path).to eq("/ports/#{@la.id}")
    end

    it "Has a link for the child" do
      expect(page).to have_link(@battleship.name)
      click_on @battleship.name
      expect(current_path).to eq("/ships/#{@battleship.id}")
    end

    describe "When I click the link 'Delete Ship'" do
      it "Then I am taken to '/ships' where I do not see the deleted ship" do
        find(".delete-ship-#{@battleship.id}").click

        expect(current_path).to eq("/ships")

        expect(page).to_not have_content(@battleship.name)
      end
    end
  end
end
