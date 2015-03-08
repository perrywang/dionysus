package org.dionysus;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.lightadmin.api.config.LightAdmin;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.web.WebApplicationInitializer;

@Configuration
@Order(Ordered.LOWEST_PRECEDENCE)
public class LightAdminWebApplication implements WebApplicationInitializer {

//	@Bean
//    public ServletContextInitializer servletContextInitializer() {
//        return new ServletContextInitializer() {
//            @Override
//            public void onStartup(ServletContext servletContext) throws ServletException {
//                LightAdmin.configure(servletContext)
//                        .basePackage("org.dionysus.admin")
//                        .baseUrl("/admin")
//                        .security(false);
//
//                new LightAdminWebApplicationInitializer().onStartup(servletContext);
//            }
//        };
//    }
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		LightAdmin.configure(servletContext)
			 .basePackage("org.dionysus.admin")
			 .baseUrl("/admin")
			 .security(false);
	}
}
