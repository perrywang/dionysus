package org.dionysus;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.lightadmin.api.config.LightAdmin;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.web.WebApplicationInitializer;

@SpringBootApplication
@Order(Ordered.LOWEST_PRECEDENCE)
public class LightAdminWebApplication implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		System.out.println("stop here");
		LightAdmin.configure(servletContext)
			 .basePackage("org.dionysus.admin")
			 .baseUrl("/admin")
			 .security(false);
	}
}
