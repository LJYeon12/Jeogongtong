package com.comeat.jeogongtong;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.scheduling.annotation.EnableScheduling;
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
public class JeogongtongApplication {

	public static void main(String[] args) {
		SpringApplication.run(JeogongtongApplication.class, args);
	}

}
