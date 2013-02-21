require "rubygems"
require "bundler/setup"
require 'goliath'
require 'em-synchrony/activerecord'
require 'grape'
require 'rack/cors'
require 'grape/rabl'

require './app/apis/SKIT_API'
require './app/models/swatch'
require './app/models/manufacturer'
require './app/models/domain'
require './app/models/collection'

class Application < Goliath::API

	# importing the grape api module for the application
	include SKit

	use Rack::Cors do
	  allow do
	  	# change to your specific localhost for dev, and any consumption domains for production
	  	# this also needs to be set in your API module, this istance sets the OPTION headers
	    origins 'http://localhost:8888'
	    # location of your API
	    resource '/v1/*', :headers => :any, :methods => [:get, :post, :options, :put]
	  end
	end
	
	# config json source paths for rabl
	use Rack::Config do |env|
		env['api.tilt.root'] = 'app/json/'
	end
	
	# configure Rabl to properly create JSON to be consumed by Ember Data
	Rabl.configure do |config|
		config.include_json_root = false
		config.include_child_root = false
	  config.view_paths = ['app/json/']
	end

  def response(env)
    API.call(env)
  end

end