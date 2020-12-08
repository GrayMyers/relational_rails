require 'rails_helper'

describe 'as a visitor when I visit the ports index page' do
  it 'Then I see the name of each port record in the system' do
    la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)
    ny = Port.create!(name: 'New York', panamax: false, dock_count: 3)
    orleans = Port.create!(name: 'New Orleans', panamax: true, dock_count: 2)

    visit '/ports'

    expect(page).to have_content(la.name)
    expect(page).to have_content(ny.name)
    expect(page).to have_content(orleans.name)
  end

  it 'I see the most recently created records in order by recency from top to bottom' do
    la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5, created_at: 'Mon, 07 Dec 2020 01:00:00 UTC +00:00')
    orleans = Port.create!(name: 'New Orleans', panamax: true, dock_count: 2, created_at: 'Tues, 08 Dec 2020 01:00:00 UTC +00:00')
    ny = Port.create!(name: 'New York', panamax: false, dock_count: 3, created_at: 'Wed, 09 Dec 2020 01:00:00 UTC +00:00')

    visit '/ports'

    expect(ny.name).to appear_before(orleans.name)
    expect(orleans.name).to appear_before(la.name)
  end
end
