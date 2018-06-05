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
      admin = User.create(username: "Dee", password: "password", role: 1)
      genre = Genre.create(name: name)
      genre2 = Genre.create(name: name2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path

      expect(page).to have_field('genre[name]')
      expect(page).to have_button('Create Genre')
    end

    it "allows admin to fill in a form for a new genres" do
      name = 'Sci-Fi'
      name2 = 'Comedy'
      name3 = 'Mystery'
      admin = User.create(username: "Dee", password: "password", role: 1)
      genre = Genre.create(name: name)
      genre2 = Genre.create(name: name2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path
      fill_in 'genre[name]', with: name3
      click_on('Create Genre')

      expect(current_path).to eq(admin_genres_path)
      within('body') do
        expect(page).to have_content(name3)
      end
    end
  end
end
