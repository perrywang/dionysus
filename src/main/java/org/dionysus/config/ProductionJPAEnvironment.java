package org.dionysus.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.sina.sae.util.SaeUserInfo;

@Configuration
@Profile("prod")
public class ProductionJPAEnvironment {

	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_dionysus" );
		dataSource.setUsername(SaeUserInfo.getAccessKey());
		dataSource.setPassword(SaeUserInfo.getSecretKey());
		return dataSource;
	}
}
