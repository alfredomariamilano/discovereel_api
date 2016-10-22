class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :tmdb_id
      t.string :title
      t.string :original_title
      t.string :poster_path
      t.string :release_date
      t.string :images
      t.string :overview
      t.string :imdb_id
      t.string :videos
      t.string :genres
      t.string :vote_average

      t.timestamps
    end
  end
end
