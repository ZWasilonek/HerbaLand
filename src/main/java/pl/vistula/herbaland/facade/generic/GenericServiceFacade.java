package pl.vistula.herbaland.facade.generic;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

import java.util.List;
import java.util.Set;

public interface GenericServiceFacade<D> {

  D create(D dto);

  D update(D dto);

  Set<D> findAll();

  Page<D> findAll(int pageNo, int limit);

  boolean remove(D dto);

  D findById(Integer id);

  <D> PageImpl<D> convertObjectsToPage(List<D> objects, int pageNo, int limit);

}