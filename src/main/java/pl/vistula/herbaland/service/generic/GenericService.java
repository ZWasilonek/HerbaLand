package pl.vistula.herbaland.service.generic;

import java.util.Set;

public interface GenericService<T> {

  T create(T entity);

  T update(T entity);

  Set<T> findAll();

  boolean remove(T entity);

  T findById(Integer id);

}