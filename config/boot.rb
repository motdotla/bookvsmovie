ENV["RACK_ENV"] ||= "development"

require 'bundler'
Bundler.setup

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

Dotenv.load

require './config/constants'
require './config/goodreads'

Dir["./lib/*.rb"].each { |f| require f }

require './app/application'

Dir["./app/*.rb"].each { |f| require f }
