require 'rails_helper'

describe 'as a visitor when I visit the vehicle index page' do
  it 'Then I see the name of each vehicle record in the system' do
    visit '/vehicles'
    expect(page).to have_content("Boeing 747")
    expect(page).to have_content("Toyota Highlander")
    expect(page).to have_content("Ford Raptor")
  end

  it 'Then I see a link which takes me to a creation page' do
    visit '/vehicles'
    expect(page).to have_link("creation link")
    click_link "creation_link"
    expect(current_path).to eq("/new")
    expect(page).to have_content("Create a New Vehicle")
  end
end
