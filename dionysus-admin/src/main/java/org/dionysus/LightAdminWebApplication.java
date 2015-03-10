package org.dionysus;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.lightadmin.api.config.LightAdmin;
import org.lightadmin.core.config.LightAdminWebApplicationInitializer;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.embedded.ServletContextInitializer;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;

@SpringBootApplication
@Configuration
@Order(Ordered.HIGHEST_PRECEDENCE)
@Import(DomainApplicationContext.class)
public class LightAdminWebApplication extends SpringBootServletInitializer {

	@Bean
    public ServletContextInitializer servletContextInitializer() {
        return new ServletContextInitializer() {
            @Override
            public void onStartup(ServletContext servletContext) throws ServletException {
            	LightAdmin.configure(servletContext)
	                .basePackage("org.dionysus.admin")
	                .baseUrl("/admin")
	                .security(false);
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
