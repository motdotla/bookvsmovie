class Application < Sinatra::Base
  helpers do
    def jsonify(*args)
      render(:jsonify, *args)
    end
  end
 
  get "/" do
    File.read(File.join('public', 'index.html'))
  end

  get "/search.json" do
    content_type 'application/json'

    title   = params[:q]
    
    # Book
    client  = Goodreads.new
    book    = client.book_by_title title

    # Movie
    result  = ROTTENTOMATOES.get "/api/public/v1.0/movies.json?apikey=#{ROTTENTOMATOES_API_KEY}&q=#{title}&page_limit=1"
    json    = JSON.parse(result.body)
    movie   = json["movies"][0]
    
    {
      success: true,
      book: {
        image_url: book["image_url"]
      },
      movie: {
        image_url: movie["posters"]["profile"]
      }
    }.to_json
  end
end
