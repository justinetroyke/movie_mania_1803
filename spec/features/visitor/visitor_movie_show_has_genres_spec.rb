require 'rails_helper'

describe "user visits movie show page" do
  it "visitor sees movie genres" do
    name = 'Horror'
    name2 = 'Comedy'
    descrb2 = 'Best Don Knotts film'
    director = Director.create(name: 'So and So')
    movie2 = 'The Ghost and Mr. Chicken'
    genre = Genre.create(name: name)
    genre2 = Genre.create(name: name2)
    movie = Movie.create(title: movie2, description: descrb2, director_id: director.id)
    movie_genre = MovieGenre.create(movie_id: movie.id, genre_id: genre.id)
    movie_genre2 = MovieGenre.create(movie_id: movie.id, genre_id: genre2.id)

    visit movie_path(movie.slug)

    expect(page).to have_content("Genres for this Movie:")
    expect(page).to have_content(genre.name)
    expect(page).to have_content(genre2.name)
  end
end
# As a Visitor,
#   When I visit a movie show page,
#     I see genre names under a heading that says
#     "Genres for this Movie:"
#       and the genres listed are only the genres
#       associated with this movie.
#
# (for testing purposes,
#   I should see at least 2 genres listed for a movie)
