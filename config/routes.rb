module Routes
  class App
    def self.define 
      Rack::Builder.new do
        routes = Usher::Interface.for(:rack) do
          add('/').to(ChatController)
          add('/background').to(SocketController)
        end
        
        file_server = Rack::File.new(File.join(File.dirname(__FILE__), '../public/'))
        run Rack::Cascade.new([file_server, routes])
      end
    end
  end
end