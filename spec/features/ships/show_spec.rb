require 'rails_helper'

describe 'As a visitor when I visit /ships/:id' do
  it "Then I see the ship with that id including the ship's attributes:" do
    visit '/ships/1'

    expect(page).to have_content("Shipwreck")
    expect(page).to have_content("Floating: false")
    expect(page).to have_content("Crew Count: 0")

    visit '/ships/2'

    expect(page).to have_content("Battleship")
    expect(page).to have_content("Floating: true")
    expect(page).to have_content("Crew Count: 1500")
  end
end
