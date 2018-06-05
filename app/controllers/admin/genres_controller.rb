class Admin::GenresController < Admin::BaseController
  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    redirect to admin_genres_path
  end

private
  def genre_params
    params.require(:genre)
    .permit(
      :name
    )
  end
end