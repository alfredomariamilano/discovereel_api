require 'net/http'
require 'json'

[User, Viewing].each { |model| model.destroy_all }

u1 = User.create!({
  username: "alfredo",
  first_name: "Alfredo Maria",
  last_name: "Milano",
  email: "alfredo@alfredo.com",
  password: "password",
  password_confirmation: "password"
})

# GET MOVIES --------------------------------------------

# counter = 0
# (1..1000).each do |index|
#   url = "https://api.themoviedb.org/3/movie/#{index}?api_key=#{ENV["TMDB_API_KEY"]}&language=en-US&append_to_response=images,videos&include_image_language=en,null"
#   uri = URI(url)
#   response = Net::HTTP.get(uri)
#   movie = JSON.parse(response)
#
#   if (movie["title"] && movie["original_title"] && movie["poster_path"] && movie["release_date"] && movie["images"]["backdrops"].any? && movie["overview"] && movie["imdb_id"] && movie["videos"]["results"].any? && movie["vote_average"])
#     Movie.create!(
#     title:          movie["title"],
#     poster_path:    movie["poster_path"],
#     release_date:   movie["release_date"],
#     overview:       movie["overview"],
#     imdb_id:        movie["imdb_id"],
#     tmdb_id:        index,
#     vote_average:   movie["vote_average"]
#     )
#     counter += 1
#     puts counter
#   end
# end

# https://api.themoviedb.org/3/discover/movie?api_key=87f717b2446422b5e237165050d45a17&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=true&page=1&vote_count.gte=50&vote_average.gte=6&vote_average.lte=10

# GET MOVIES --------------------------------------------

counter = 0

total_pages = 176
page = 1

(1..total_pages).each do
url = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["TMDB_API_KEY"]}&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=true&page=#{page}&vote_count.gte=50&vote_average.gte=6&vote_average.lte=10"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  list = JSON.parse(response)

  list["results"].each do |movie|

    Movie.create!(
        title:          movie["title"],
        poster_path:    movie["poster_path"],
        release_date:   movie["release_date"],
        overview:       movie["overview"],
        imdb_id:        movie["imdb_id"],
        tmdb_id:        movie["id"],
        vote_average:   movie["vote_average"]
        )
        counter += 1
            puts counter
  end

  page +=1
end

# --------------------------------------------------------------

# base_url          = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["TMDB_API_KEY"]}"
# total_movie_url   = "#{base_url}&language=en-US"
# uri               = URI(total_movie_url)
# response          = Net::HTTP.get_response(uri)
# remaining         = response.to_hash["x-ratelimit-remaining"].first.to_i
# json              = JSON.parse(response.body)
# total_results     = response.body["total_results"]
# total_pages       = response.body["total_pages"]
#
# page              = response.body["page"]

# --------------------- Example
#
# /mLrQMqyZgLeP8FrT5LCobKAiqmK.jpg
#
# {
#   "poster_path"=>"/mLrQMqyZgLeP8FrT5LCobKAiqmK.jpg",
#   "adult"=>false,
#   "overview"=>
#   "The USS Enterprise crew explores the furthest reaches of uncharted space,
# where they encounter a mysterious new enemy who puts them and everything the Fed
# eration stands for to the test.",
#   "release_date"=>"2016-07-07",
#   "genre_ids"=>[28, 12, 878, 53],
#   "id"=>188927,
#   "original_title"=>"Star Trek Beyond",
#   "original_language"=>"en",
#   "title"=>"Star Trek Beyond",
#   "backdrop_path"=>"/6uBlEXZCUHM15UNZqNig17VdN4m.jpg",
#   "popularity"=>32.442341,
#   "vote_count"=>927,
#   "video"=>false,
#   "vote_average"=>6.36
# },

# 1.upto(10) do |n|
#   p n
#   sleep 1
# end
# total_movie_count = json["total_results"]


# (1..422276).each do |index|
#   url = "https://api.themoviedb.org/3/movie/#{index}?api_key=#{ENV["TMDB_API_KEY"]}&language=en-US&append_to_response=images,videos&include_image_language=en,null"
#   uri = URI(url)
#   response = Net::HTTP.get(uri)
#   movie = JSON.parse(response)
#
#   if (movie["title"] && movie["original_title"] && movie["poster_path"] && movie["release_date"] && movie["images"]["backdrops"].any? && movie["overview"] && movie["imdb_id"] && movie["videos"]["results"].any? && movie["vote_average"])
#     Movie.create!(
#     title:          movie["title"],
#     original_title: movie["original_title"],
#     poster_path:    movie["poster_path"],
#     release_date:   movie["release_date"],
#     images:         movie["images"]["backdrops"][0]["file_path"],
#     overview:       movie["overview"],
#     imdb_id:        movie["imdb_id"],
#     tmdb_id:        index,
#     videos:         movie["videos"]["results"][0]["key"],
#     vote_average:   movie["vote_average"]
#     )
#     counter += 1
#     puts counter
#   end
#
# end


# t.string   "tmdb_id"       --discover
# t.string   "title"         --discover
# t.string   "original_title"--discover
# t.string   "poster_path"   --discover
# t.string   "release_date"  --discover
# t.string   "overview"      --discover
# t.string   "vote_average"  --discover
#
# t.string   "genres"--discover(only id)
#
# t.string   "images" --search movie by id
# t.string   "imdb_id"--search movie by id
# t.string   "videos" --search movie by id
