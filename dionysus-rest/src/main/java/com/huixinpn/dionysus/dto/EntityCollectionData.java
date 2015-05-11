package com.huixinpn.dionysus.dto;

import com.huixinpn.dionysus.domain.AbstractDionysusPersistable;
import com.huixinpn.dionysus.exception.dto.TransformException;
import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Collection;

@Slf4j
public class EntityCollectionData<T extends EntityData> {

  private Iterable<? extends AbstractDionysusPersistable> entities;
  private Class<T> dataClass;

  public EntityCollectionData(Iterable<? extends AbstractDionysusPersistable> entities, Class<T> dataClass) {
    this.entities = entities;
    this.dataClass = dataClass;
  }

  public Collection<T> toDTOCollection() {
    Collection<T> results = new ArrayList<>();
    for (AbstractDionysusPersistable entity : entities) {
      try {
        Constructor<T> constructor = dataClass.getConstructor(entity.getClass());
        results.add(constructor.newInstance(entity));
      } catch (NoSuchMethodException e) {
        log.error(dataClass.toString() + " lost constructor accept correct domain object");
        throw new TransformException(e);
      } catch (Exception e) {
        log.error("Constructing dto failed.", e);
        throw new TransformException(e);
      }
    }
    return results;
  }
}
