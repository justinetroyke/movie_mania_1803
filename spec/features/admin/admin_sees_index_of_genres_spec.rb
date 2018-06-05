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
  end

  # context "as default user" do
  #   it "does not allow default user to see admin categories index" do
  #     user = User.create(username: "Ian", password: "password123", role: 0)
  #
  #     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #
  #     visit admin_categories_path
  #
  #     expect(page).to_not have_content("Admin Categories")
  #     expect(page).to have_content("The page you were looking for doesn't exist")
  #   end
  # end
end
# As an admin user,
#   When I visit the genre index page,
#   I see a list of all genre names in the database.
#
# (for testing purposes,
#   I should see at least 2 genres listed)
