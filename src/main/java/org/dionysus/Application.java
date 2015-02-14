package org.dionysus;

import javax.sql.DataSource;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.sina.sae.util.SaeUserInfo;

@Configuration
@EnableAutoConfiguration
@ComponentScan
public class Application extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(Application.class);
	}

	public static void main(String[] args) {
		new SpringApplicationBuilder()
			.profiles("dev")
			.sources(Application.class)
			.run(args);
	}

	@Bean
	@Profile("prod")
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_dionysus");
		dataSource.setUsername(SaeUserInfo.getAccessKey());
		dataSource.setPassword(SaeUserInfo.getSecretKey());
		return dataSource;
	}
}
