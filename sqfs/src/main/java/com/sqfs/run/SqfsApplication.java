package com.sqfs.run;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * 程序入口
 * @author lzs on 2017.11.7
 */

@SpringBootApplication
@ComponentScan("com.sqfs")
public class SqfsApplication {
		
	public static void main(String[] args) {
		SpringApplication.run(SqfsApplication.class, args);
	}
}
