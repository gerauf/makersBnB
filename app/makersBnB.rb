ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'tilt/erb'

require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/spaces'
require_relative 'controllers/sessions'


class MakersBnB < Sinatra::Base

set :root, File.join(File.dirname(__FILE__))
enable :sessions
register Sinatra::Flash

  get '/' do
    @spaces = Space.all
    erb :index
  end

  post '/bookings' do
    id = params[:id]
    redirect '/bookings/' + id
  end

  get '/bookings/:id' do
    @space = Space.get(params['id'])
    erb :'bookings/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
