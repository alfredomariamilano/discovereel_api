class MovieSerializer < ActiveModel::Serializer
  attributes :id, :tmdb_id, :title, :poster_path, :release_date, :images, :overview, :imdb_id, :videos, :genres, :vote_average
end
