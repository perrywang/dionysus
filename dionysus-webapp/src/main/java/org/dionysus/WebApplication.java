package org.dionysus;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing(auditorAwareRef = "springSecurityAuditorAware")
public class WebApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.profiles("prod").sources(DomainApplicationContext.class);
	}

	public static void main(String[] args) {
		new SpringApplicationBuilder()
			.profiles("dev")
			.sources(DomainApplicationContext.class)
			.run(args);
	}
}
