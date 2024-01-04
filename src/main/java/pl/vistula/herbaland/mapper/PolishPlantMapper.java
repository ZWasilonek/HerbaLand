package pl.vistula.herbaland.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import pl.vistula.herbaland.dto.PolishPlantDTO;
import pl.vistula.herbaland.model.PolishPlant;
import pl.vistula.herbaland.mapper.generic.GenericMapper;

@Mapper(componentModel = "spring")
public interface PolishPlantMapper extends GenericMapper<PolishPlant, PolishPlantDTO> {

  PolishPlantMapper INSTANCE = Mappers.getMapper(PolishPlantMapper.class);

}