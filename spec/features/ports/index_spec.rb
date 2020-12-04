require 'rails_helper'

describe 'as a visitor when I visit the port index page' do
  it 'Then I see the name of each port record in the system' do
    la = Port.create(name: 'Los Angeles', panamax: true, dock_count: 5)
    ny = Port.create(name: 'New York', panamax: false, dock_count: 3)
    orleans = Port.create(name: 'New Orleans', panamax: true, dock_count: 2)

    visit '/ports'

    expect(page).to have_content(la.name)
    expect(page).to have_content(ny.name)
    expect(page).to have_content(orleans.name)
  end
end
