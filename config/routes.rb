module Routes
  class App
    def self.build 
      Rack::Builder.new do
        use Rack::Session::Cookie
        
        routes = HttpRouter.new do
          add('/').to(ChatController)
          add('/background').to(SocketController)
        end
        
        file_server = Rack::File.new(File.join(File.dirname(__FILE__), '../public/'))
        run Rack::Cascade.new([file_server, routes])
      end
    end
  end
end