require 'rubygems'
require 'bundler'
require 'thin'
require 'http_router'
require 'erubis'
require 'cramp/controller'
require 'cramp/model'
require 'active_support/all'
require 'active_support/json'

require 'app/controllers/socket_controller'
require 'app/controllers/chat_controller'
require 'config/routes'

#Bundler
Bundler.setup