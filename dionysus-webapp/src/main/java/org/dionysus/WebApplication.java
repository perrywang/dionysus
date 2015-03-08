package org.dionysus;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Import;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
@Order(Ordered.HIGHEST_PRECEDENCE)
@Import(DomainApplicationContext.class)
public class WebApplication extends SpringBootServletInitializer {
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.profiles("prod").sources(WebApplication.class, LightAdminWebApplication.class);
	}

	public static void main(String[] args) {
		new SpringApplicationBuilder()
			.profiles("dev")
			.sources(WebApplication.class, LightAdminWebApplication.class)
			.run(args);
	}
}
