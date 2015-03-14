package org.dionysus.admin;

import org.dionysus.domain.User;
import org.lightadmin.api.config.AdministrationConfiguration;
import org.lightadmin.api.config.builder.FieldSetConfigurationUnitBuilder;
import org.lightadmin.api.config.unit.FieldSetConfigurationUnit;

public class UserAdministration extends AdministrationConfiguration<User> {

	@Override
	public FieldSetConfigurationUnit listView(
			FieldSetConfigurationUnitBuilder fragmentBuilder) {
		return fragmentBuilder
				.field("username")
				.caption("User Name")
				.build();
	}
}
