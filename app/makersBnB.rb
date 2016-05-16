ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/users'

class MakersBnB < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__))

  get '/' do
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
