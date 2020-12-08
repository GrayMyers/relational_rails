require 'rails_helper'


describe 'as a visitor when I visit the vehicle index page' do
  it 'Then I see the name of each vehicle record in the system' do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    car = Vehicle.create(name:"Toyota Highlander", locked: false, passenger_capacity: 4)
    truck = Vehicle.create(name:"Ford Raptor", locked: true, passenger_capacity: 5)
    visit '/vehicles'
    expect(page).to have_content("Boeing 747")
    expect(page).to have_content("Toyota Highlander")
    expect(page).to have_content("Ford Raptor")
  end

  it 'Then I see a link which takes me to a creation page' do
    visit '/vehicles'
    expect(page).to have_link("New Vehicle")
    click_link "New Vehicle"
    expect(current_path).to eq("/vehicles/new")
    expect(page).to have_content("Create a New Vehicle")
  end

  it "Orders records by recency and locked value" do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    car = Vehicle.create(name:"Toyota Highlander", locked: false, passenger_capacity: 4)
    truck = Vehicle.create(name:"Ford Raptor", locked: true, passenger_capacity: 5)

    visit '/vehicles'

    #check order of elements as they appear on the page
    expect(page.body.index("Ford Raptor")).to be < page.body.index("Boeing 747")
    expect(page.body.index("Boeing 747")).to be < page.body.index("Toyota Highlander")
  end
end
