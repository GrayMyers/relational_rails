require "rails_helper"

describe 'as a visitor when I visit the vehicle index page' do
  it 'Then I see the name of each vehicle record in the system' do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    passenger1 = plane.passengers.create(name: "passenger 1", driver:false, age:37)
    passenger3 = plane.passengers.create(name: "passenger 3", driver:true, age:65)
    visit '/passengers'
    expect(page).to have_content("passenger 1")
    expect(page).to have_content("false")
    expect(page).to have_content("37")

    expect(page).to have_content("passenger 2")
    expect(page).to have_content("false")
    expect(page).to have_content("37")
  end
end
