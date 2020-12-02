require 'rails_helper'

describe 'as a visitor when I visit the page of a vehicle by id' do
  it "Then I see the parent with that id including the parent's attributes" do
    visit '/passengers/1'
    expect(page).to have_content("Bill Fox")
    expect(page).to have_content("Driving: true")
    expect(page).to have_content("Age: 31")
  end
end

describe 'as a visitor when I visit the page of a vehicle by id' do
  it "Then I see the parent with that id including the parent's attributes" do
    visit '/passengers/2'
    expect(page).to have_content("Jenna Thompson")
    expect(page).to have_content("Driving: false")
    expect(page).to have_content("Age: 7")
  end
end

describe 'as a visitor when I visit the page of a vehicle by id' do
  it "Then I see the parent with that id including the parent's attributes" do
    visit '/passengers/3'
    expect(page).to have_content("Jane Fox")
    expect(page).to have_content("Driving: false")
    expect(page).to have_content("Age: 29")
  end
end
