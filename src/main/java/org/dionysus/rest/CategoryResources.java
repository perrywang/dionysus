package org.dionysus.rest;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.dionysus.model.Category;
import org.dionysus.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Path("/categories")
public class CategoryResources {

	@Autowired
	CategoryService service;
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Category create(Category category) {
		return service.save(category);
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Category> getAll() {
		return service.findAll();
	}
	
	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Category find(@PathParam("id") Long id) {
		return service.find(id);
	}
}
