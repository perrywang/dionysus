package org.dionysus.bae;

import java.util.logging.Logger;

import org.springframework.cloud.util.EnvironmentAccessor;

class BAESettings {
	public static final String BOOTSTRAP_PROPERTIES_FILENAME = "bae.properties";

	private static final Logger logger = Logger.getLogger(BAESettings.class
			.getName());

	private final EnvironmentAccessor env;

	private final String classpathPropertiesFilename;

	BAESettings(final EnvironmentAccessor env,
			final String classpathPropertiesFilename) {
		this.env = env;
		this.classpathPropertiesFilename = classpathPropertiesFilename;
	}

	BAESettings(final EnvironmentAccessor env) {
		this(env, BOOTSTRAP_PROPERTIES_FILENAME);
	}

	BAESettings() {
		this(new EnvironmentAccessor());
	}

	String getAppID() {
		return null;
	}

	String getSecretKey() {
		return null;
	}

	String getMySqlDBName() {
		return null;
	}

	String getRedisDBName() {
		return null;
	}

	String getMongoDBName() {
		return null;
	}
}
