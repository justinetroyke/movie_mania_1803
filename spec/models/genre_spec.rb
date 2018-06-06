require 'rails_helper'

describe Genre, type: :model do
  describe "relationships" do
    it {should have_many(:movies).through(:movie_genres)}
  end

  describe '.average_rating' do
    it 'should return average rating of movies in genre' do
      name2 = 'Comedy'
      movie = 'Daddy Day Care'
      rating = 5
      rating2 = 3
      descrb = 'Dads can not handle kid crap'
      descrb2 = 'Best Don Knotts film'
      director = Director.create(name: 'So and So')
      movie2 = 'The Ghost and Mr. Chicken'
      genre2 = Genre.create(name: name2)
      movie = genre2.movies.create(title: movie, description: descrb, director_id: director.id, rating: rating)
      movie2 = genre2.movies.create(title: movie2, description: descrb2, director_id: director.id, rating: rating2)

      expect(genre2.average_rating).to eq(4)
    end
  end
end
