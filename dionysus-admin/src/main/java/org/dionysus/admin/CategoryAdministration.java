package org.dionysus.admin;

import org.dionysus.domain.Category;
import org.lightadmin.api.config.AdministrationConfiguration;
import org.lightadmin.api.config.builder.EntityMetadataConfigurationUnitBuilder;
import org.lightadmin.api.config.unit.EntityMetadataConfigurationUnit;

public class CategoryAdministration extends AdministrationConfiguration<Category> {
	
	@Override
	public EntityMetadataConfigurationUnit configuration(
			EntityMetadataConfigurationUnitBuilder configurationBuilder) {
		return configurationBuilder
				.nameField("name")
				.pluralName("Categories")
				.singularName("Category")
				.build();
	}
}
