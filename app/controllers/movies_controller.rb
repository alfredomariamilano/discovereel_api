class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  require 'net/http'
  require 'json'

  # GET /movies
  def index
    random_ids = Movie.ids.sort_by { rand }.slice(0, 10)
    @movies = Movie.where(:id => random_ids)
    # @movies = Movie.all

    render json: @movies
  end

  # GET /movies/1
  def show
    @movie = Movie.find_by(id: params[:id])
    url = "https://api.themoviedb.org/3/movie/#{@movie["tmdb_id"]}?api_key=#{ENV["TMDB_API_KEY"]}&language=en-US&append_to_response=images,videos&include_image_language=en,null"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    movie = JSON.parse(response)
    @movie["images"] = movie["images"]
    render json: @movie
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def movie_params
      params.require(:movie).permit(:tmdb_id, :title, :original_title, :poster_path, :release_date, :images, :overview, :imdb_id, :videos, :genres, :vote_average)
    end
end
