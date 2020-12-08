require 'rails_helper'

describe Ship do
  describe 'relationships' do
    it { should belong_to :port }
  end

  describe 'class helper methods' do
    it 'sorted_recent_at_top' do
      @la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5, created_at: 'Mon, 07 Dec 2020 01:00:00 UTC +00:00')
      @wreck = @la.ships.create!(name: 'Shipwreck', floating: false, crew_count: 0, created_at: 'Tues, 08 Dec 2020 01:00:00 UTC +00:00')
      @battleship = @la.ships.create!(name: 'Battleship', floating: true, crew_count: 1500, created_at: 'Thurs, 10 Dec 2020 01:00:00 UTC +00:00')
      @destroyer = @la.ships.create!(name: 'Destroyer', floating: true, crew_count: 100, created_at: 'Weds, 9 Dec 2020 01:00:00 UTC +00:00')

      expect(@la.ships.sorted_recent_at_top).to eq([@battleship, @destroyer, @wreck])
    end
  end
end
