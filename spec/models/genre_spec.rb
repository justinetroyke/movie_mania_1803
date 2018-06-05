require 'rails_helper'

describe Genre, type: :model do
  describe "relationships" do
    it {should have_many(:movies).through(:movie_genres)}
  end
end
