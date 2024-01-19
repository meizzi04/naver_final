package config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration // servlet-context.xml 파일 대신 현재 클래스 설정
public class MyPathConfig implements WebMvcConfigurer{

	// http://ip:port/upload/파일명
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/upload/**").addResourceLocations("file:///c:/fullstack/upload/");
	}
	
}
