package pl.vistula.herbaland.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import pl.vistula.herbaland.dto.WorkingAreaDTO;
import pl.vistula.herbaland.mapper.generic.GenericMapper;
import pl.vistula.herbaland.model.WorkingArea;

@Mapper(componentModel = "spring")
public interface WorkingAreaMapper extends GenericMapper<WorkingArea, WorkingAreaDTO> {

  WorkingAreaMapper INSTANCE = Mappers.getMapper(WorkingAreaMapper.class);

}