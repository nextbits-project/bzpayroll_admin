package com.payroll;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@EnableJpaRepositories
public class PayrollApplication  {

	public static void main(String[] args) {
		// Set system property for Tomcat's multipart file count limit
		// This must be set BEFORE Spring Boot starts Tomcat
		// The property name is used by Tomcat's FileUploadBase class
		System.setProperty("org.apache.tomcat.util.http.fileupload.FileCountLimit", "1000");
		
		SpringApplication.run(PayrollApplication.class, args);
	}
	@Bean
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}
}

