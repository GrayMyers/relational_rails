require "rails_helper"

describe "As a user" do
  describe "When I visit the song show page" do
    it "I see the song's attributes" do
      talking_heads = Artist.create!(name: 'Talking Heads')
      she_was = talking_heads.songs.create(title: 'And She Was', length: 234, play_count: 2994 )
      wild_life = talking_heads.songs.create(title: 'Wild Wild Life', length: 456, play_count: 384889 )

      visit "/songs/#{she_was.id}"

      expect(page).to have_content(she_was.title)
      expect(page).to have_content("Length: #{she_was.length}")
      expect(page).to have_content("Play Count: #{she_was.play_count}")
    end
  end
end
