package org.dionysus;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.metamodel.EntityType;
import javax.persistence.metamodel.Metamodel;

import org.dionysus.domain.InvalidEntity;
import org.junit.Assert;
import org.junit.Test;
import org.reflections.Reflections;

/**
 * https://hibernate.atlassian.net/browse/HHH-6896
 * 
 * Because of above issue, the entity ID cannot be detect when its parent class
 * is generic with extends like:
 * 
 * <code>
 * class AbstractPersistable<PK extends Serializable> implements Persistable<PK>
 * 
 * class Article extends AbstractPersistable<Long>
 * </code>
 *
 * In this kind of situation, Hibernate will calculate its "id" data type as
 * "java.io.Serializable" which may cause error in spring-data-rest
 */
public class EntityIDTest extends AbstractPersistentTest {

	@Test
	public void makeSureEntityIDCanbeDetect() {
		Metamodel model = entityManager.getMetamodel();
		final Reflections reflections = new Reflections("org.dionysus.domain");
		Set<Class<?>> entities = reflections.getTypesAnnotatedWith(Entity.class);

		for (Class<?> entity : entities) {
			EntityType<?> entityType = model.entity(entity);
			Class<?> id = entityType.getIdType().getJavaType();
			System.out.println(entityType);
			if (entity.equals(InvalidEntity.class)) {
				Assert.assertEquals(id, Serializable.class);
			} else {
				Assert.assertNotEquals(id, Serializable.class);
			}
		}
	}
}
