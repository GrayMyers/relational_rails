require 'rails_helper'

describe 'As a visitor when I visit a port show page' do
  it "Then I see the port with that id including the port's attributes" do
    visit '/ports/1'

    expect(page).to have_content("Los Angeles")
    expect(page).to have_content("Open: true")
    expect(page).to have_content("Number of Ships: 5")

    visit '/ports/2'

    expect(page).to have_content("New York")
    expect(page).to have_content("Open: false")
    expect(page).to have_content("Number of Ships: 3")
  end
end
