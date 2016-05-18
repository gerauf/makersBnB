ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'tilt/erb'

require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/spaces'
require_relative 'controllers/sessions'
require_relative 'controllers/requests'


class MakersBnB < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__))
  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def own_space? space_id
      current_user.spaces.include? Space.first(space_id)
    end
  end

  get '/' do
    @user = User.new
    erb :'users/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
