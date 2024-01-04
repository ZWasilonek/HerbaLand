package pl.vistula.herbaland.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import pl.vistula.herbaland.dto.LatinPlantDTO;
import pl.vistula.herbaland.mapper.generic.GenericMapper;
import pl.vistula.herbaland.model.LatinPlant;

@Mapper(componentModel = "spring")
public interface LatinPlantMapper extends GenericMapper<LatinPlant, LatinPlantDTO> {

  LatinPlantMapper INSTANCE = Mappers.getMapper(LatinPlantMapper.class);

}