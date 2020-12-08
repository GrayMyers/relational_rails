require 'rails_helper'

describe Port do
  describe 'relationships' do
    it { should have_many :ships }
  end
end
