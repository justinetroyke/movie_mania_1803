require 'rails_helper'

describe "User visits genres show page" do
  context "as visitor" do
    it "allows visitor to see all movies in genre" do
      name = 'Sci-Fi'
      name2 = 'Comedy'
      movie = 'Daddy Day Care'
      descrb = 'Dads can not handle kid crap'
      descrb2 = 'Best Don Knotts film'
      director = Director.create(name: 'So and So')
      movie2 = 'The Ghost and Mr. Chicken'
      Genre.create(name: name)
      genre2 = Genre.create(name: name2)
      movie = genre2.movies.create(title: movie, description: descrb, director_id: director.id)
      movie2 = genre2.movies.create(title: movie2, description: descrb2, director_id: director.id)

      visit genre_path(genre2)

      expect(page).to have_content(movie.name)
      expect(page).to have_content(movie2.name)
    end
  end
end

# As a Visitor,
#   When I visit a genre show page,
#     I see all movies associated with that
#     genre listed on the page.
#
# (for testing purposes, I should see at
#   least 2 movies listed for a genre)
