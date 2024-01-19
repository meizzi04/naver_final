package websocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration // xml 대신 설정
@EnableWebSocket // 웹소켓 관련 설정
public class MyWebsocketConfig implements WebSocketConfigurer{

	ChatWebsocketHandler chatWebsocketHandler;
	
	public MyWebsocketConfig(ChatWebsocketHandler chatWebsocketHandler) {
		super();
		this.chatWebsocketHandler = chatWebsocketHandler;
	}

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chatWebsocketHandler, "/ws").setAllowedOrigins("*");
	}
}
