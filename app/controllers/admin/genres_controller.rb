class Admin::GenresController < Admin::BaseController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params)

    redirect_to admin_genres_path
  end

private
  def genre_params
    params.require(:genre)
    .permit(
      :name
    )
  end
end
