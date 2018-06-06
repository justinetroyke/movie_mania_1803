require 'rails_helper'

describe "user visits movie show page" do
  it "visitor sees movie genres" do
    name = 'Sci-Fi'
    name2 = 'Comedy'
    movie = 'Daddy Day Care'
    rating = 5
    rating2 = 3
    descrb = 'Dads can not handle kid crap'
    descrb2 = 'Best Don Knotts film'
    director = Director.create(name: 'So and So')
    movie2 = 'The Ghost and Mr. Chicken'
    Genre.create(name: name2)
    genre2 = Genre.create(name: name2)
    movie = genre2.movies.create(title: movie, description: descrb, director_id: director.id, rating: rating)
    movie2 = genre2.movies.create(title: movie2, description: descrb2, director_id: director.id, rating: rating2)

    visit genre_path(genre2)

    expect(page).to have_content('Average Rating: 4')
  end
end
