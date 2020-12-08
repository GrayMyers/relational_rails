require 'rails_helper'

describe Ship do
  describe 'relationships' do
    it { should belong_to :port }
  end
end
