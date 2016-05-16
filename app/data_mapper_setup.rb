require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

# require_relative 'models/....'

DataMapper.setup(:default, ENV["DATABASE_URL"] || "postgres://localhost/makersBnB_#{ENV['RACK_ENV']}")
DataMapper.finalize
