require 'rubygems'
require 'bundler'
require 'cramp/controller'
require 'cramp/model'
require 'erubis'
require 'usher'
require 'active_support/all'
require 'active_support/json'

require 'app/controllers/socket_controller'
require 'app/controllers/chat_controller'
require 'config/routes'

#Bundler
Bundler.setup