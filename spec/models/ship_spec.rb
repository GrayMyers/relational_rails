require 'rails_helper'

describe Ship do
  describe 'relationships' do
    it { should belong_to :port }
  end

  describe 'class helper methods' do
    describe 'floating_at_top' do
      it 'should return all the ships sorted with floating ships at the top' do
        la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)
        wreck = la.ships.create!(name: 'Shipwreck', floating: false, crew_count: 0)
        battleship = la.ships.create!(name: 'Battleship', floating: true, crew_count: 1500)
        destroyer = la.ships.create!(name: 'Destroyer', floating: true, crew_count: 100)

        expect(Ship.all.floating_at_top).to eq([battleship, destroyer, wreck])
      end
    end
  end
end
