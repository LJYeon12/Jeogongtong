package com.comeat.jeogongtong;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
@EnableScheduling
public class MyApplication { //weektime 초기화를 위한 설정
    public static void main(String[] args) {
        SpringApplication.run(MyApplication.class, args);
    }
}

