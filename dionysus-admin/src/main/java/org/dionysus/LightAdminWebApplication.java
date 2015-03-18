package org.dionysus;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.lightadmin.api.config.LightAdmin;
import org.lightadmin.core.config.LightAdminWebApplicationInitializer;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.embedded.ServletContextInitializer;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

@Configuration
@EnableAutoConfiguration
@ComponentScan
public class LightAdminWebApplication extends SpringBootServletInitializer {

	/* Used for running in "embedded" mode */
	@Bean
	@Profile("dev")
    public ServletContextInitializer servletContextInitializer() {
        return new ServletContextInitializer() {
            @Override
            public void onStartup(ServletContext servletContext) throws ServletException {
            	LightAdmin.configure(servletContext)
	                .basePackage("org.dionysus.admin")
	                .baseUrl("/admin")
	                .security(true);
	    		new LightAdminWebApplicationInitializer().onStartup(servletContext);
            }
        };
    }
	
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(LightAdminWebApplication.class);
    }
	
	public static void main(String[] args) {
		new SpringApplicationBuilder()
			.profiles("dev")
			.sources(LightAdminWebApplication.class)
			.run(args);
	}
}
