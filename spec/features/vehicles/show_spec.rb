require 'rails_helper'

describe 'as a visitor when I visit the page of a vehicle by id' do
  it "Then I see the parent with that id including the parent's attributes" do
    visit '/vehicles/1'
    expect(page).to have_content("Boeing 747")
    expect(page).to have_content("Locked: true")
    expect(page).to have_content("Seats: 100")
  end
end

describe 'as a visitor when I visit the page of a vehicle by id' do
  it "Then I see the parent with that id including the parent's attributes" do
    visit '/vehicles/2'
    expect(page).to have_content("Toyota Highlander")
    expect(page).to have_content("Locked: false")
    expect(page).to have_content("Seats: 4")
  end
end

describe 'as a visitor when I visit the page of a vehicle by id' do
  it "Then I see the parent with that id including the parent's attributes" do
    visit '/vehicles/3'
    expect(page).to have_content("Ford Raptor")
    expect(page).to have_content("Locked: true")
    expect(page).to have_content("Seats: 5")
  end
end
