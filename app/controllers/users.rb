ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

require_relative 'data_mapper_setup'

require_relative 'server'

class Users < Sinatra::Base
  get '/users' do
    redirect '/users/new'
  end

  get '/users/new' do
    'Hello Users!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
