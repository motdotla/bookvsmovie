class Application < Sinatra::Base
  helpers do
    def jsonify(*args)
      render(:jsonify, *args)
    end
  end
 
  get "/" do
    "hello world!"
  end
end
