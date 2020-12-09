require 'rails_helper'

describe Port do
  describe 'relationships' do
    it { should have_many :ships }
  end

  describe 'class helper methods' do
    describe 'panamax_capable_at_top' do
      it 'should return all the ports sorted with panamax capable ports at the top' do
        la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)
        ny = Port.create!(name: 'New York', panamax: false, dock_count: 3)
        orleans = Port.create!(name: 'New Orleans', panamax: true, dock_count: 2)

        expect(Port.panamax_capable_at_top).to eq([la, orleans, ny])
      end
    end
  end

  describe 'helper methods' do
    describe 'ship_count' do
      it 'should return the number of ships that belong to this port' do
        la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5)
        la.ships.create!(name: 'Battleship', floating: true, crew_count: 1500)
        la.ships.create!(name: 'Destroyer', floating: true, crew_count: 100)

        expect(la.ship_count).to eq(2)

        la.ships.create!(name: 'New Ship', floating: true, crew_count: 100)

        expect(la.ship_count).to eq(3)
      end
    end
  end
end
