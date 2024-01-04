package pl.vistula.herbaland.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import pl.vistula.herbaland.dto.AuthorizationRoleDTO;
import pl.vistula.herbaland.model.AuthorizationRole;
import pl.vistula.herbaland.mapper.generic.GenericMapper;

@Mapper(componentModel = "spring")
public interface AuthorizationRoleMapper extends GenericMapper<AuthorizationRole, AuthorizationRoleDTO> {

  AuthorizationRoleMapper INSTANCE = Mappers.getMapper(AuthorizationRoleMapper.class);

}