require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url, as: :json
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post movies_url, params: { movie: { genres: @movie.genres, images: @movie.images, imdb_id: @movie.imdb_id, original_title: @movie.original_title, overview: @movie.overview, poster_path: @movie.poster_path, release_date: @movie.release_date, title: @movie.title, tmdb_id: @movie.tmdb_id, videos: @movie.videos, vote_average: @movie.vote_average } }, as: :json
    end

    assert_response 201
  end

  test "should show movie" do
    get movie_url(@movie), as: :json
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { genres: @movie.genres, images: @movie.images, imdb_id: @movie.imdb_id, original_title: @movie.original_title, overview: @movie.overview, poster_path: @movie.poster_path, release_date: @movie.release_date, title: @movie.title, tmdb_id: @movie.tmdb_id, videos: @movie.videos, vote_average: @movie.vote_average } }, as: :json
    assert_response 200
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete movie_url(@movie), as: :json
    end

    assert_response 204
  end
end
