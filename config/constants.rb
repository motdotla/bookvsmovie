RACK_ENV                  = ENV['RACK_ENV']
GOODREADS_KEY             = ENV['GOODREADS_KEY']
GOODREADS_SECRET          = ENV['GOODREADS_SECRET']
ROTTENTOMATOES_API_KEY    = ENV['ROTTENTOMATOES_API_KEY']

case RACK_ENV
when "production"
else  
  # defined above 
end
