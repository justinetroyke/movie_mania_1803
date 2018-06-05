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

      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie2.title)
    end
  end
end
