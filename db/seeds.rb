puts "Cleaning database..."
Movie.destroy_all

puts "Fetching top rated movies..."
url = "https://tmdb.lewagon.com/movie/top_rated"
movies = JSON.parse(URI.open(url).read)["results"]

puts "Creating movies..."
movies.each do |movie|
  Movie.create!(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
  puts "Created #{movie["title"]}"
end

puts "Finished!"
