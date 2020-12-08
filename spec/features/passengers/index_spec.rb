require "rails_helper"

describe 'as a visitor when I visit the passenger index page' do
  it 'Then I see the name of each passenger record in the system' do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    passenger1 = plane.passengers.create(name: "passenger 1", driver:false, age:37)
    passenger2 = plane.passengers.create(name: "passenger 2", driver:true, age:65)
    visit '/passengers'
    expect(page).to have_content("passenger 1")
    expect(page).to have_content("Driver: false")
    expect(page).to have_content("Age: 37")

    expect(page).to have_content("passenger 2")
    expect(page).to have_content("Driver: true")
    expect(page).to have_content("Age: 65")
  end

  it "Orders records by recency" do
    plane = Vehicle.create(name:"Boeing 747", locked: true, passenger_capacity: 100)
    passenger1 = plane.passengers.create(name: "passenger 1", driver:false, age:37)
    passenger2 = plane.passengers.create(name: "passenger 2", driver:true, age:65)
    passenger3 = plane.passengers.create(name: "passenger 3", driver:false, age:5)

    visit '/passengers'

    #check order of elements as they appear on the page
    expect(page.body.index("passenger 3")).to be < page.body.index("passenger 2")
    expect(page.body.index("passenger 2")).to be < page.body.index("passenger 1")
  end
end
