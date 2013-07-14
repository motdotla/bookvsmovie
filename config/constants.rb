RACK_ENV                  = ENV['RACK_ENV']
GOODREADS_KEY             = ENV['GOODREADS_KEY']
GOODREADS_SECRET          = ENV['GOODREADS_SECRET']

case RACK_ENV
when "production"
else  
  # defined above 
end
