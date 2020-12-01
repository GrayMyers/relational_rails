require 'rails_helper'

describe 'as a visitor when I visit the port index page' do
  it 'Then I see the name of each port record in the system' do
    visit '/ports'
    expect(page).to have_content("Los Angeles")
    expect(page).to have_content("New York")
    expect(page).to have_content("New Orleans")
  end
end
