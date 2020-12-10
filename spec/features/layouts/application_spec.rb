require 'rails_helper'

describe 'Application Layout (Everything Seen On All Pages)' do
  describe 'As a visitor when I visit any page on the site' do
    it 'Then I see a link at the top of the page that takes me to the Child Index' do
      visit '/vehicles'

      expect(page).to have_link('Passengers', href: '/passengers')
      expect(page).to have_link('Ships', href: '/ships')
    end

    it 'Then I see a link at the top of the page that takes me to the Parent Index' do
      visit '/vehicles'

      expect(page).to have_link('Vehicles', href: '/vehicles')
      expect(page).to have_link('Ports', href: '/ports')
    end
  end
end
