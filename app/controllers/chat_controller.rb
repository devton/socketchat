class ChatController < Cramp::Controller::Action
  on_start :build
  
  @@template = Erubis::Eruby.new(File.read(File.join(File.dirname(__FILE__), '../views/index.erb')))
  
  def build
    render @@template.result(binding)
    finish
  end
end