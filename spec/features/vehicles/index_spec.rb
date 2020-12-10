require 'rails_helper'


describe 'as a visitor when I visit the vehicle index page' do
  it 'Then I see the name of each vehicle record in the system' do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    car = Vehicle.create(name:"Toyota Highlander", locked: false, passenger_capacity: 4)
    truck = Vehicle.create(name:"Ford Raptor", locked: true, passenger_capacity: 5)
    visit '/vehicles'
    expect(page).to have_content(plane.name)
    expect(page).to have_content(car.name)
    expect(page).to have_content(truck.name)
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
    expect(page.body.index(truck.name)).to be < page.body.index(plane.name)
    expect(page.body.index(plane.name)).to be < page.body.index(car.name)
  end

  it "Has a form for only displaying records over a certain value" do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    car = Vehicle.create(name:"Toyota Highlander", locked: false, passenger_capacity: 4)
    truck = Vehicle.create(name:"Ford Raptor", locked: true, passenger_capacity: 5)

    visit "/vehicles"

    expect(page).to have_button("Only return vehicles with more than specified number of seats")
    fill_in(:search, with: 5)
    click_button "Only return vehicles with more than specified number of seats"

    expect(page).to have_content("Boeing 747")

    expect(page).to have_no_content("Toyota Highlander")
    expect(page).to have_no_content("Ford Raptor")
  end

  it "Has a link that redirects to a sorted index page containing all entries" do
    car = Vehicle.create(name:"Toyota Highlander", locked: false, passenger_capacity: 4)
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    truck = Vehicle.create(name:"Ford Raptor", locked: true, passenger_capacity: 5)

    passenger1 = plane.passengers.create(name: "passenger 1", driver:false, age:37)
    passenger2 = plane.passengers.create(name: "passenger 2", driver:true, age:65)
    passenger3 = car.passengers.create(name: "passenger 3", driver:true, age:3)

    visit "/vehicles"

    expect(page).to have_link "Sort by number of passengers"
    click_link "Sort by number of passengers"

    expect(page.body.index("Boeing 747")).to be < page.body.index("Toyota Highlander")
    expect(page.body.index("Toyota Highlander")).to be < page.body.index("Ford Raptor")
  end

  it "Has a link for each parent that redirects to the edit page" do
    car = Vehicle.create(name:"Toyota Highlander", locked: false, passenger_capacity: 4)

    visit '/vehicles'

    expect(page).to have_link("Edit")
    click_on "Edit"

    expect(current_path).to eq("/vehicles/#{car.id}/edit")
  end

  it "Has a link for each parent that deletes that parent" do
    car = Vehicle.create(name:"Toyota Highlander", locked: false, passenger_capacity: 4)

    visit '/vehicles'

    expect(page).to have_link("Delete")
    click_on "Delete"

    expect(current_path).to eq("/vehicles/")
    expect(page).to have_no_content(car.name)
  end


end
