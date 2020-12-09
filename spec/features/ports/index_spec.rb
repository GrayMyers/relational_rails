require 'rails_helper'

describe 'as a visitor when I visit the ports index page' do
  before :each do
    @la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5, created_at: 'Mon, 07 Dec 2020 01:00:00 UTC +00:00')
    @orleans = Port.create!(name: 'New Orleans', panamax: true, dock_count: 2, created_at: 'Tues, 08 Dec 2020 01:00:00 UTC +00:00')
    @ny = Port.create!(name: 'New York', panamax: false, dock_count: 3, created_at: 'Wed, 09 Dec 2020 01:00:00 UTC +00:00')

    visit '/ports'
  end

  it 'I see the name of each port record in the system' do
    expect(page).to have_content(@la.name)
    expect(page).to have_content(@ny.name)
    expect(page).to have_content(@orleans.name)
  end

  it 'I see the DateTime(s) next to each of the records in a reasonably formatted manner' do
    within(".port-#{@ny.id}") do
      expect(page).to have_content("Created on 12/09/2020")
    end

    within(".port-#{@la.id}") do
      expect(page).to have_content("Created on 12/07/2020")
    end
  end

  it 'I see the records that have a `true` above/before the records that have a false' do
    expect(@la.name).to appear_before(@ny.name)
    expect(@orleans.name).to appear_before(@ny.name)
  end
end
