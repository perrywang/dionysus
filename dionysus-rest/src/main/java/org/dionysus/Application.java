package org.dionysus;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication
public class Application {
	public static void main(String[] args) {
		new SpringApplicationBuilder()
			.profiles("dev")
			.sources(Application.class)
			.run(args);
	}
}
