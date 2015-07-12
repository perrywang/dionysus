package com.huixinpn.dionysus;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.repository.query.spi.EvaluationContextExtension;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.security.data.repository.query.SecurityEvaluationContextExtension;

@EnableJpaAuditing
@SpringBootApplication
@EnableScheduling
@Order(Ordered.HIGHEST_PRECEDENCE)
public class WebApplication extends SpringBootServletInitializer {
	
	@Bean
	EvaluationContextExtension securityExtension() {
		return new SecurityEvaluationContextExtension();
	}
	
	@Override
	protected SpringApplicationBuilder configure(
			SpringApplicationBuilder application) {
		return application.profiles("prod").sources(WebApplication.class);
	}

	public static void main(String[] args) {
		new SpringApplicationBuilder().profiles("dev")
				.sources(WebApplication.class).run(args);
	}
}
