require 'rails_helper'

describe 'as a visitor when I visit the vehicle index page' do
  it 'Then I see the name of each vehicle record in the system' do
    visit '/passengers'
    expect(page).to have_content("Bill Fox")
    expect(page).to have_content("Jenna Thompson")
    expect(page).to have_content("Jane Fox")
  end
end
