package com.huixinpn.dionysus.admin;

import org.lightadmin.api.config.AdministrationConfiguration;
import org.lightadmin.api.config.builder.EntityMetadataConfigurationUnitBuilder;
import org.lightadmin.api.config.builder.FieldSetConfigurationUnitBuilder;
import org.lightadmin.api.config.builder.PersistentFieldSetConfigurationUnitBuilder;
import org.lightadmin.api.config.unit.EntityMetadataConfigurationUnit;
import org.lightadmin.api.config.unit.FieldSetConfigurationUnit;

import com.huixinpn.dionysus.domain.Category;

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
	
	@Override
	public FieldSetConfigurationUnit listView(
			FieldSetConfigurationUnitBuilder fragmentBuilder) {
		return fragmentBuilder
				.field("name").caption("Name")
				.build();
	}
	
	@Override
	public FieldSetConfigurationUnit showView(
			FieldSetConfigurationUnitBuilder fragmentBuilder) {
		return fragmentBuilder
				.field("name").caption("Name")
				.build();
	}
	
	@Override
	public FieldSetConfigurationUnit formView(
			PersistentFieldSetConfigurationUnitBuilder fragmentBuilder) {
		return fragmentBuilder
				.field("name").caption("Name")
				.build();
	}
	
	@Override
	public FieldSetConfigurationUnit quickView(
			FieldSetConfigurationUnitBuilder fragmentBuilder) {
		return fragmentBuilder
				.field("name").caption("Name")
				.build();
	}
}
