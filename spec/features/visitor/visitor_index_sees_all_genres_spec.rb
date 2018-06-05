require 'rails_helper'

describe "User visits genres index page" do
  context "as visitor" do
    it "allows visitor to see all genres with links and does not see form" do
      name = 'Sci-Fi'
      name2 = 'Comedy'
      genre = Genre.create(name: name)
      genre2 = Genre.create(name: name2)

      visit genres_path

      expect(page).to have_content('Film Genres')
      expect(page).to have_link(genre.name)
      expect(page).to have_link(genre2.name)
      expect(page).to_not have_field('genre[name]')
    end
  end
end
