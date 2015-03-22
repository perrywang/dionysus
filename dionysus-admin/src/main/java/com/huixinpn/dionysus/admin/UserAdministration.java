package com.huixinpn.dionysus.admin;

import org.lightadmin.api.config.AdministrationConfiguration;
import org.lightadmin.api.config.builder.EntityMetadataConfigurationUnitBuilder;
import org.lightadmin.api.config.builder.FieldSetConfigurationUnitBuilder;
import org.lightadmin.api.config.builder.ScreenContextConfigurationUnitBuilder;
import org.lightadmin.api.config.unit.EntityMetadataConfigurationUnit;
import org.lightadmin.api.config.unit.FieldSetConfigurationUnit;
import org.lightadmin.api.config.unit.ScreenContextConfigurationUnit;

import com.huixinpn.dionysus.domain.User;

public class UserAdministration extends AdministrationConfiguration<User> {

	@Override
	public ScreenContextConfigurationUnit screenContext(
			ScreenContextConfigurationUnitBuilder screenContextBuilder) {
		return screenContextBuilder
				.screenName("User Administration")
				.build();
	}

	@Override
	public EntityMetadataConfigurationUnit configuration(
			EntityMetadataConfigurationUnitBuilder configurationBuilder) {
		return configurationBuilder
				.nameField("username")
				.pluralName("users")
				.singularName("user")
				.build();
	}
	
	@Override
	public FieldSetConfigurationUnit listView(
			FieldSetConfigurationUnitBuilder fragmentBuilder) {
		return fragmentBuilder
				.field("username")
				.caption("User Name")
				.build();
	}
}
