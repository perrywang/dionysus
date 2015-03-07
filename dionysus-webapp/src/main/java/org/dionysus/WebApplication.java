package org.dionysus;

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
		return application.profiles("prod").sources(DomainApplicationContext.class);
	}

	public static void main(String[] args) {
		new SpringApplicationBuilder()
			.profiles("dev")
			.sources(DomainApplicationContext.class)
			.run(args);
	}
	
//	@Bean(initMethod="start", destroyMethod="stop")
//	@Profile("dev")
//	public org.h2.tools.Server h2WebServer() throws SQLException {
//	   return org.h2.tools.Server.createWebServer(
//	      "-web", "-webAllowOthers", "-webPort", "8082"
//	   );
//	}
	
	// should move database connection info into environment variables
	@Bean
	@Profile("prod")
	public DataSource dataSource() {
		return DataSourceBuilder.create()
			.driverClassName("com.mysql.jdbc.Driver")
			.url("jdbc:mysql://sqld.duapp.com:4050/SHZCffxtwwoGmGUwxoZb")
			.username("xN3Lv2liVPWHfu5ywr0UPWoT")
			.password("L7Yc5LOT2SgYtZidaN0eHFQ1ZLLnGh8c")
			.build();
	}
}
