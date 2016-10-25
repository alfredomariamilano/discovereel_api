class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :tmdb_id
      t.string :title
      t.string :poster_path
      t.string :release_date
      t.json :images, array: true, :default => []
      t.string :overview
      t.string :imdb_id
    t.json :videos, array: true, :default => []
      t.string :genres
      t.string :vote_average

      t.timestamps
    end
  end
end
