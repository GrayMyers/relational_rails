require 'rails_helper'

describe 'as a visitor when I visit the ports index page' do
  before :each do
    @la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5, created_at: 'Mon, 07 Dec 2020 01:00:00 UTC +00:00')
    @orleans = Port.create!(name: 'New Orleans', panamax: true, dock_count: 2, created_at: 'Tues, 08 Dec 2020 01:00:00 UTC +00:00')
    @ny = Port.create!(name: 'New York', panamax: false, dock_count: 3, created_at: 'Wed, 09 Dec 2020 01:00:00 UTC +00:00')

    visit '/ports'
  end

  it 'I see the name of each port record in the system' do
    expect(page).to have_content(@la.name)
    expect(page).to have_content(@ny.name)
    expect(page).to have_content(@orleans.name)
  end

  it 'I see the DateTime(s) next to each of the records in a reasonably formatted manner' do
    within(".port-#{@ny.id}") do
      expect(page).to have_content("Created on 12/09/2020")
    end

    within(".port-#{@la.id}") do
      expect(page).to have_content("Created on 12/07/2020")
    end
  end


  it "Next to every parent, I see a link to edit that parent's info" do
    expect(page).to have_link("Edit")
    first(:link, "Edit").click
    expect(current_path).to eq("/ports/#{@ny.id}/edit")
  end
  
  it "Next to every parent, I see a link to delete that parent" do
    expect(page).to have_link("Delete")
    first(:link, "Delete").click
    expect(current_path).to eq("/ports")
    expect(page).to have_no_content(@ny.name)
  end
  
  it 'I see the records that have panamax `true` above/before the records that have a false' do
    expect(@la.name).to appear_before(@ny.name)
  end

  it 'Then I see a link to sort ports by the number of ships they have' do
    expect(page).to have_link('Sort Ports By Ships')
  end

  describe "When I click on the 'Sort Ports By Ships' link" do
    it "I'm taken back to '/ports' where I see all of the ports in order of their count of ships" do
      @la.ships.create!(name: 'Shipwreck', floating: false, crew_count: 0)
      @ny.ships.create!(name: 'Battleship', floating: true, crew_count: 1500)
      @ny.ships.create!(name: 'Destroyer', floating: true, crew_count: 100)

      click_link('Sort Ports By Ships')

      expect(current_path).to eq('/ports')

      expect(@ny.name).to appear_before(@la.name)
      expect(@la.name).to appear_before(@orleans.name)
    end

    it 'I see the number of ships next to each port name' do
      @la.ships.create!(name: 'Shipwreck', floating: false, crew_count: 0)

      click_link('Sort Ports By Ships')

      expect(page).to have_content('Los Angeles Ships: 1')
      expect(page).to have_content('New York Ships: 0')
      expect(page).to have_content('New Orleans Ships: 0')
    end
  end

  describe 'I see a form that allows me to input a number value' do
    describe 'When I input a number value and click the submit button' do
      it 'The ports index page renders only ports with dock_counts greater than the input number value' do
        fill_in 'dock_count_limit', with: '2'

        click_on 'Only return ports with more docks than the given `Dock Count Threshold Number`'

        expect(page).to have_content(@la.name)
        expect(page).to have_content(@ny.name)
        expect(page).to_not have_content(@orleans.name)
      end
    end
  end
end
