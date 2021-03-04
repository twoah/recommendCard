package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
// 배포용

public class BcCardProject1Application extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(BcCardProject1Application.class, args);
	}

	@Override protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) { 
		return builder.sources(BcCardProject1Application.class); }


}

//test용
/*
public class BcCardProject1Application {

	public static void main(String[] args) {
		SpringApplication.run(BcCardProject1Application.class, args);
	}

}*/
