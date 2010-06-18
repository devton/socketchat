$(document).ready(function(){
	var location = 'ws://0.0.0.0:8080/background'
	   
	var wsocket = new WebSocket(location);
	
	wsocket.onopen = function (e) {
		var name = $('#nick').val();
		$('#chat-log').append('<div>ligando chat para '+name+'.</div>')
	};
	
	wsocket.onmessage = function (e){
		var data = JSONstring.toObject(e.data);
			
		$(data).each(function(i,item){
			var chat_html = []
			chat_html.push('<div class="message">');
			chat_html.push('<strong>'+item.username+' <span>DIZ:</span></strong>');
			chat_html.push('<p>'+item.message+'</p>');
			chat_html.push('</div>');
			
			$('#chat-log').append(chat_html.join(' '));
			var messages = document.getElementById("chat-log");
			messages.scrollTop = messages.scrollHeight;
		});
	};
	
	$('#chat-input form').submit(function(){
		var serial = String(this.apelido.value + '||' + this.mensagem.value );
		wsocket.send(serial);
		$("textarea#mensagem").val(" ");
		$("textarea").focus();
	})
});