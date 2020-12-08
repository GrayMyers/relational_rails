require 'rails_helper'

describe ApplicationRecord do
  describe 'class helper methods' do
    it 'sorted_recent_at_top' do
      la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5, created_at: 'Mon, 07 Dec 2020 01:00:00 UTC +00:00')
      orleans = Port.create!(name: 'New Orleans', panamax: true, dock_count: 2, created_at: 'Tues, 08 Dec 2020 01:00:00 UTC +00:00')
      ny = Port.create!(name: 'New York', panamax: false, dock_count: 3, created_at: 'Wed, 09 Dec 2020 01:00:00 UTC +00:00')

      wreck = la.ships.create!(name: 'Shipwreck', floating: false, crew_count: 0, created_at: 'Tues, 08 Dec 2020 01:00:00 UTC +00:00')
      battleship = la.ships.create!(name: 'Battleship', floating: true, crew_count: 1500, created_at: 'Thurs, 10 Dec 2020 01:00:00 UTC +00:00')
      destroyer = la.ships.create!(name: 'Destroyer', floating: true, crew_count: 100, created_at: 'Weds, 9 Dec 2020 01:00:00 UTC +00:00')

      expect(Port.all.sorted_recent_at_top).to eq([ny, orleans, la])
      expect([la,ny].sorted_recent_at_top).to eq([ny,la])
      expect(Ship.all.sorted_recent_at_top).to eq([battleship, destroyer, wreck])
      expect([wreck,battleship].sorted_recent_at_top).to eq([battleship, wreck])
    end
  end
end
