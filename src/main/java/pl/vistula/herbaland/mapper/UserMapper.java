package pl.vistula.herbaland.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import pl.vistula.herbaland.dto.UserDTO;
import pl.vistula.herbaland.model.User;
import pl.vistula.herbaland.mapper.generic.GenericMapper;

@Mapper(componentModel = "spring", uses = {MedicinalPlantMapper.class})
public interface UserMapper extends GenericMapper<User, UserDTO> {

  UserMapper INSTANCE = Mappers.getMapper(UserMapper.class);

}