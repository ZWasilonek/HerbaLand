package pl.vistula.herbaland.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import pl.vistula.herbaland.dto.MedicinalPlantDTO;
import pl.vistula.herbaland.mapper.generic.GenericMapper;
import pl.vistula.herbaland.model.MedicinalPlant;

@Mapper(componentModel = "spring", uses = {MultiTypeFileMapper.class})
public interface MedicinalPlantMapper extends GenericMapper<MedicinalPlant, MedicinalPlantDTO> {

  MedicinalPlantMapper INSTANCE = Mappers.getMapper(MedicinalPlantMapper.class);

}