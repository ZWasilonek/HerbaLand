package pl.vistula.herbaland.facade.generic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import pl.vistula.herbaland.mapper.generic.GenericMapper;
import pl.vistula.herbaland.model.generic.GenericEntityID;
import pl.vistula.herbaland.service.generic.GenericService;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public abstract class GenericServiceFacadeImpl<E extends GenericEntityID, D,
    S extends GenericService<E>, M extends GenericMapper<E, D>> implements GenericServiceFacade<D> {

  protected S service;
  protected M mapper;


  @Autowired
  public GenericServiceFacadeImpl(S service, M mapper) {
    this.service = service;
    this.mapper = mapper;
  }


  @Override
  public D create(D dto) {
    return mapper.mapEntityToDTO(service.create(mapper.mapDTOToEntity(dto)));
  }

  @Override
  public D findById(Integer id) {
    return mapper.mapEntityToDTO(service.findById(id));
  }

  @Override
  public D update(D dto) {
    return mapper.mapEntityToDTO(service.update(mapper.mapDTOToEntity(dto)));
  }

  @Override
  public Set<D> findAll() {
    return mapper.mapEntitiesToDTOs(service.findAll());
  }

  @Override
  public Page<D> findAll(int pageNo, int limit) {
    List<D> allDTOs = findAll().stream().toList();
    return convertObjectsToPage(allDTOs, pageNo, limit);
  }

  public <D> PageImpl<D> convertObjectsToPage(List<D> objects, int pageNo, int limit) {
    Pageable pageRequest = createPageRequestUsing(pageNo, limit);

    int start = (int) pageRequest.getOffset();
    int end = Math.min((start + pageRequest.getPageSize()), objects.size());

    List<D> pageContent = objects.subList(start, end);
    return new PageImpl<>(pageContent, pageRequest, objects.size());
  }

  private Pageable createPageRequestUsing(int pageNo, int limit) {
    return PageRequest.of(pageNo, limit);
  }

  @Override
  public boolean remove(D dto) {
    return service.remove(mapper.mapDTOToEntity(dto));
  }

}