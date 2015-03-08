package org.dionysus.admin;

import org.dionysus.domain.Article;
import org.dionysus.repository.ArticleRepository;
import org.lightadmin.api.config.AdministrationConfiguration;
import org.lightadmin.api.config.builder.EntityMetadataConfigurationUnitBuilder;
import org.lightadmin.api.config.unit.EntityMetadataConfigurationUnit;
import org.springframework.beans.factory.annotation.Autowired;

public class ArticleAdministration extends AdministrationConfiguration<Article> {

	@Autowired
	private ArticleRepository articleRepository;
	
	@Override
	public EntityMetadataConfigurationUnit configuration(EntityMetadataConfigurationUnitBuilder configurationBuilder) {
		return configurationBuilder
				.pluralName("Articles")
				.singularName("Article")
				.build();
	}
}
