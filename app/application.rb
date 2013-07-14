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
    client  = Goodreads.new
    book    = client.book_by_title title
    
    {
      success: true,
      book: {
        image_url: book["image_url"]
      },
      movie: {
        image_url: nil
      }
    }.to_json
  end
end
