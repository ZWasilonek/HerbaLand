package pl.vistula.herbaland.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import pl.vistula.herbaland.dto.DiseaseDTO;
import pl.vistula.herbaland.mapper.generic.GenericMapper;
import pl.vistula.herbaland.model.Disease;

@Mapper(componentModel = "spring")
public interface DiseaseMapper extends GenericMapper<Disease, DiseaseDTO> {

  DiseaseMapper INSTANCE = Mappers.getMapper(DiseaseMapper.class);

}