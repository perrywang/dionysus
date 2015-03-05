package org.dionysus;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing(auditorAwareRef = "springSecurityAuditorAware")
public class WebApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.profiles("prod").sources(Application.class);
	}

	public static void main(String[] args) {
		new SpringApplicationBuilder()
			.profiles("dev")
			.sources(Application.class)
			.run(args);
	}
	
	@Bean(initMethod="start", destroyMethod="stop")
	@Profile("dev")
	public org.h2.tools.Server h2WebServer() throws SQLException {
	   return org.h2.tools.Server.createWebServer(
	      "-web", "-webAllowOthers", "-webPort", "8082"
	   );
	}
	
	// should move database connection info into environment variables
	@Bean
	@Profile("prod")
	public DataSource dataSource() {
		return DataSourceBuilder.create()
			.driverClassName("com.mysql.jdbc.Driver")
			.url("jdbc:mysql://sqld.duapp.com:4050/euoGBFukVdNWbXbwpDXP")
			.username("l0Y2c6iKt4wLpCsKrAREEKzT")
			.password("j9WtgYWKLkVxGbR4E2E6jLPl5mk8vgKj")
			.build();
	}
}
