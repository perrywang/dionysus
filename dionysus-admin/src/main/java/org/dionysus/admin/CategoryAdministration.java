package org.dionysus.admin;

import org.dionysus.domain.Category;
import org.dionysus.repository.CategoryRepository;
import org.lightadmin.api.config.AdministrationConfiguration;
import org.lightadmin.api.config.builder.EntityMetadataConfigurationUnitBuilder;
import org.lightadmin.api.config.unit.EntityMetadataConfigurationUnit;
import org.springframework.beans.factory.annotation.Autowired;

public class CategoryAdministration extends AdministrationConfiguration<Category> {

	@Autowired
	private CategoryRepository categoryRepository;
	
	@Override
	public EntityMetadataConfigurationUnit configuration(
			EntityMetadataConfigurationUnitBuilder configurationBuilder) {
		return configurationBuilder
				.pluralName("Categories")
				.singularName("Category")
				.build();
	}
}
