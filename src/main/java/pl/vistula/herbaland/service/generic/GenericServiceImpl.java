package pl.vistula.herbaland.service.generic;

import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import pl.vistula.herbaland.model.generic.GenericEntityID;

import java.util.*;

public abstract class GenericServiceImpl<T, R extends JpaRepository<T, Integer>> implements GenericService<T> {

  protected R repository;

  @Autowired
  public GenericServiceImpl(R repository) {
    this.repository = repository;
  }

  @Override
  public T create(T entity) {
    try {
      return repository.save(entity);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  @Override
  public T findById(Integer id) {
    Optional<T> foundedOptional = repository.findById(id);
    if (foundedOptional.isPresent()) {
      return foundedOptional.get();
    }
    throw new ServiceException("Cannot find item with id " + id);
  }

  @Override
  public T update(T entity) {
    Optional<T> foundedOptional = repository.findById(((GenericEntityID) entity).getId());
    if (foundedOptional.isPresent()) {
      T foundedEntity = foundedOptional.get();
      ((GenericEntityID) entity).setId(((GenericEntityID) foundedEntity).getId());
      return repository.save(entity);
    }
    throw new ServiceException("Cannot find item to update");
  }

  @Override
  public Set<T> findAll() {
    return new TreeSet<>((Collection) repository.findAll());
  }

  @Override
  public boolean remove(T entity) {
    Optional<T> foundEntity = repository.findById(((GenericEntityID) entity).getId());
    if (foundEntity.isPresent()) {
      repository.delete(entity);
      return repository.findById(((GenericEntityID) entity).getId()).isPresent();
    }
    return false;
  }

}