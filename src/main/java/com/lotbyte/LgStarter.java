package com.lotbyte;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.lotbyte.lg")
@MapperScan("com.lotbyte.lg.mapper")
public class LgStarter {
    public static void main(String[] args) {
        SpringApplication.run(LgStarter.class);
    }
}
