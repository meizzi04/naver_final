package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

//동일 패키지는 자동 component-scan
//다른 패키지는 수동으로 설정 추가 필요
@ComponentScan(basePackages="config")
@ComponentScan(basePackages="upload")
@ComponentScan(basePackages="board.spring.mybatis")
@ComponentScan(basePackages="websocket")
//@ComponentScan(basePackages="db_jasypt")

// DAO에 Mapper로 annotation 준 걸 읽어오는 설정
@MapperScan(basePackages="board.spring.mybatis")

@SpringBootApplication
public class DemoApplication {
	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
		System.out.println("===부트 시작===");
	}
}
