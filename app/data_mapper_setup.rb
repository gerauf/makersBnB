require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

require './app/uploader/my_uploader'
require_relative 'models/user'
require_relative 'models/space'
require_relative 'models/request'
require_relative 'models/availability'
require_relative 'models/space_image'


DataMapper.setup(:default, ENV["DATABASE_URL"] || "postgres://localhost/makersBnB_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade! # do we still need this?
