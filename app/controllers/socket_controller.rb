class SocketController < Cramp::Controller::Websocket
  on_start :define_variables
  periodic_timer :retrieve_messages, :every => 2
  on_data :receive_message
  
  @@chat ,@@id = [], 0
  
  def define_variables
    @retrieved, @retrieve = [], []
  end
  
  def receive_message(data)
    /^(.*)\|\|(.*)$/.match(data)
    @@chat << {:id => (@@id+=1), :username => $1, :message => $2}
  end
  
  def retrieve_messages
    if chat_messages.to_a.size > 0
      render chat_messages.to_json
      clean_collection
    end
  end
  
  def chat_messages
    collection_for_chat if @@chat.size > 0
  end
  
  def collection_for_chat
    @@chat.each do |item|
      unless @retrieved.include? item[:id]
        @retrieve << item 
        @retrieved << item[:id]
      end
    end
    @retrieve
  end
  
  def clean_collection
    @retrieve = []
  end
end