require 'config/env'

Cramp::Controller::Websocket.backend = :thin
Thin::Logging.trace = true
Rack::Handler::Thin.run Routes::App.build, :Port => 8080