package org.dionysus;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.lightadmin.api.config.LightAdmin;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@Configuration
@EnableAutoConfiguration
@EnableJpaAuditing
@ComponentScan
@Order(Ordered.HIGHEST_PRECEDENCE)
public class WebApplication extends SpringBootServletInitializer {

	@Override
	public void onStartup(ServletContext servletContext)
			throws ServletException {
		LightAdmin.configure(servletContext)
				.basePackage("org.dionysus.admin")
				.baseUrl("/admin")
				.security(false)
				.backToSiteUrl("http://dionysus.duapp.com/admin");
		super.onStartup(servletContext);
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
