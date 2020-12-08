require 'rails_helper'

describe Port do
  describe 'relationships' do
    it { should have_many :ships }
  end

  describe 'class helper methods' do
    it 'sorted_recent_at_top' do
      la = Port.create!(name: 'Los Angeles', panamax: true, dock_count: 5, created_at: 'Mon, 07 Dec 2020 01:00:00 UTC +00:00')
      orleans = Port.create!(name: 'New Orleans', panamax: true, dock_count: 2, created_at: 'Tues, 08 Dec 2020 01:00:00 UTC +00:00')
      ny = Port.create!(name: 'New York', panamax: false, dock_count: 3, created_at: 'Wed, 09 Dec 2020 01:00:00 UTC +00:00')

      expect(Port.sorted_recent_at_top).to eq([ny, orleans, la])
    end
  end
end
