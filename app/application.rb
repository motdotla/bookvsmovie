class Application < Sinatra::Base
  helpers do
    def jsonify(*args)
      render(:jsonify, *args)
    end
  end
 
  get "/" do
    File.read(File.join('public', 'index.html'))
  end

  get "/stylesheets/:path" do
    content_type 'text/css'
    File.read(File.join('public', 'stylesheets', params[:path]))
  end

  get "/javascripts/jquery.js" do
    content_type 'application/javascript'
    File.read(File.join('public', 'javascripts', "jquery.js"))
  end

  get "/search.json" do
    content_type 'application/json'
    
    begin
      title   = params[:q]
      
      # Book
      client  = Goodreads.new
      book    = client.book_by_title title
      book_rating = ((book.average_rating.to_f / 5.0) * 100).to_i

      # Movie
      result  = ROTTENTOMATOES.get "/api/public/v1.0/movies.json?apikey=#{ROTTENTOMATOES_API_KEY}&q=#{title}&page_limit=1"
      json    = JSON.parse(result.body)
      movie   = json["movies"][0]
      movie_rating = (movie["ratings"]["critics_score"]).to_i

      # Winner
      winner  = "movie"
      winner  = "book" if book_rating > movie_rating

      {
        success: true,
        winner: winner,
        book: {
          image_url: book["image_url"],
          rating: book_rating
        },
        movie: {
          image_url: movie["posters"]["profile"],
          rating: movie_rating 
        }
      }.to_json
    rescue
      {
        success: false,
        error: "There was an error. Try again"
      }.to_json
    end
  end
end
