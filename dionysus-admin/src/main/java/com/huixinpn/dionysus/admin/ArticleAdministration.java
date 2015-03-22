package com.huixinpn.dionysus.admin;

import org.lightadmin.api.config.AdministrationConfiguration;
import org.lightadmin.api.config.builder.EntityMetadataConfigurationUnitBuilder;
import org.lightadmin.api.config.builder.FieldSetConfigurationUnitBuilder;
import org.lightadmin.api.config.builder.PersistentFieldSetConfigurationUnitBuilder;
import org.lightadmin.api.config.builder.ScreenContextConfigurationUnitBuilder;
import org.lightadmin.api.config.unit.EntityMetadataConfigurationUnit;
import org.lightadmin.api.config.unit.FieldSetConfigurationUnit;
import org.lightadmin.api.config.unit.ScreenContextConfigurationUnit;
import org.lightadmin.api.config.utils.Editors;

import com.huixinpn.dionysus.domain.Article;

public class ArticleAdministration extends AdministrationConfiguration<Article> {
	
	@Override
	public ScreenContextConfigurationUnit screenContext(
			ScreenContextConfigurationUnitBuilder screenContextBuilder) {
		return screenContextBuilder
				.screenName("Article Administration")
				.build();
	}
	
	@Override
	public EntityMetadataConfigurationUnit configuration(EntityMetadataConfigurationUnitBuilder configurationBuilder) {
		return configurationBuilder
				.nameField("title")
				.pluralName("Articles")
				.singularName("Article")
				.build();
	}
	
	@Override
	public FieldSetConfigurationUnit listView(FieldSetConfigurationUnitBuilder fragmentBuilder) {
		return fragmentBuilder
				.field("title").caption("Title")
				.field("category").caption("Category")
				.build();
	}
	
	@Override
	public FieldSetConfigurationUnit showView(
			FieldSetConfigurationUnitBuilder fragmentBuilder) {
		return fragmentBuilder
				.field("title").caption("Title")
				.field("category").caption("Category")
				.build();
	}
	
	@Override
	public FieldSetConfigurationUnit formView(
			PersistentFieldSetConfigurationUnitBuilder fragmentBuilder) {
		return fragmentBuilder
				.field("title").caption("Title")
				.field("body").caption("Body").editor(Editors.wysiwyg())
				.field("category").caption("Category")
				.build();
	}
	
	@Override
	public FieldSetConfigurationUnit quickView(
			FieldSetConfigurationUnitBuilder fragmentBuilder) {
		return fragmentBuilder
				.field("title").caption("Title")
				.field("category").caption("Category")
				.build();
	}
}
