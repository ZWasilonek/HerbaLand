package pl.vistula.herbaland.mapper.generic;

import java.util.Set;

public interface GenericMapper<E, D> {

  public D mapEntityToDTO(E entity);

  public E mapDTOToEntity(D DTO);

  public Set<D> mapEntitiesToDTOs(Set<E> entities);

  public Set<E> mapDTOsToEntities(Set<D> DTOs);

}