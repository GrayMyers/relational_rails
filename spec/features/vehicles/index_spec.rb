require 'rails_helper'

describe 'as a visitor when I visit the vehicle index page' do
  it 'Then I see the name of each vehicle record in the system' do
    visit '/ports'
    expect(page).to have_content("Boeing 747")
    expect(page).to have_content("Toyota Highlander")
    expect(page).to have_content("Ford Raptor")
  end
end
