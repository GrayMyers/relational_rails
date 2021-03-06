require 'rails_helper'

describe 'As a visitor when I visit a port show page' do
  it "Then I see the port with that id including the port's attributes" do
    la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)
    ny = Port.create!(name: 'New York', panamax: false, dock_count: 3)
    orleans = Port.create!(name: 'New Orleans', panamax: true, dock_count: 2)

    visit "/ports/#{la.id}"

    expect(page).to have_content(la.name)
    expect(page).to have_content("Panamax Capable: #{la.panamax}")
    expect(page).to have_content("Dock Count: #{la.dock_count}")

    visit "/ports/#{ny.id}"

    expect(page).to have_content(ny.name)
    expect(page).to have_content("Panamax Capable: #{ny.panamax}")
    expect(page).to have_content("Dock Count: #{ny.dock_count}")
  end

  it "Then I see a link to take me to that port's ships page ('/ports/:id/ships')" do
    la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)

    visit "/ports/#{la.id}"

    click_on 'Port Ships'

    expect(current_path).to eql("/ports/#{la.id}/ships")
  end

  describe "When I click the link 'Update Port'" do
    it "Then I am taken to '/ports/:id/edit'" do
      la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)

      visit "/ports/#{la.id}"

      click_on 'Update Port'

      expect(current_path).to eql("/ports/#{la.id}/edit")
    end
  end

  describe "When I click the link 'Delete Port'" do
    it "I am redirected to '/ports' where I no longer see the port" do
      la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)

      visit "/ports/#{la.id}"

      click_on 'Delete Port'

      expect(current_path).to eql("/ports")
      expect(page).to_not have_content('Los Angeles')
    end
  end
end
