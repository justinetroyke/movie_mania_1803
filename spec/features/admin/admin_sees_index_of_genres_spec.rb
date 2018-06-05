require 'rails_helper'

describe "User visits genres index page" do
  context "as admin" do
    it "allows admin to see all genres" do
      name = 'Sci-Fi'
      name2 = 'Comedy'
      admin = User.create(username: "Dee", password: "password", role: 1)
      genre = Genre.create(name: name)
      genre2 = Genre.create(name:name)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path

      expect(page).to have_content('Film Genres')
      expect(page).to have_content(genre.name)
      expect(page).to have_content(genre.name)
    end

    it "allows admin to fill in a form for a new genres" do
      name = 'Sci-Fi'
      name2 = 'Comedy'
      name3 = 'Mystery'
      admin = User.create(username: "Dee", password: "password", role: 1)
      genre = Genre.create(name: name)
      genre2 = Genre.create(name:name)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path
      save_and_open_page

      expect(page).to have_field('name')
      expect(page).to have_button('Create Genre')
    end
  end
end

# As an admin user,
#   When I visit the genre index page,
#   I see a form to create a new genre.
