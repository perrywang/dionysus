package com.huixinpn.dionysus.dto;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.dto.user.UserData;
import com.huixinpn.dionysus.exception.dto.TransformException;
import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Collection;

@Slf4j
public class EntityCollectionData<S extends AbstractDionysusPersistable> {

  private Iterable<S> entities;

  public EntityCollectionData(Iterable<S> entities) {
    this.entities = entities;
  }

  public <T extends EntityData> Collection<T> toDTOCollection(Class<T> klass) {
    Collection<T> results = new ArrayList<>();
    for (S entity : entities) {
      try {
        Constructor<T> constructor = klass.getConstructor(entity.getClass());
        results.add(constructor.newInstance(entity));
      } catch (NoSuchMethodException e) {
        log.error(klass.toString() + " lost constructor accept corresponding domain object");
        throw new TransformException(e);
      } catch (Exception e) {
        log.error("Constructing dto failed.", e);
        throw new TransformException(e);
      }
    }
    return results;
  }
}
