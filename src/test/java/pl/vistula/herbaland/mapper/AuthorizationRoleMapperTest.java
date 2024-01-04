package pl.vistula.herbaland.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import pl.vistula.herbaland.dto.AuthorizationRoleDTO;
import pl.vistula.herbaland.model.AuthorizationRole;
import pl.vistula.herbaland.util.Mock;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
class AuthorizationRoleMapperTest {

  private final AuthorizationRole role = Mock.getRoles();
  private final AuthorizationRoleDTO roleDTO = Mock.getRolesDTO();


  @Test
  void shouldMapAuthorizationRoleEntityToDTO() {
    //when
    AuthorizationRoleDTO roleDto = AuthorizationRoleMapper.INSTANCE.mapEntityToDTO(role);
    //then
    assertNotNull(roleDto);
    assertEquals(roleDto.getId(), role.getId());
    assertEquals(roleDto.getName(), role.getName());
  }

  @Test
  void shouldMapAuthorizationRoleDTOToEntity() {
    //when
    AuthorizationRole roleEntity = AuthorizationRoleMapper.INSTANCE.mapDTOToEntity(roleDTO);
    //then
    assertNotNull(roleEntity);
    assertEquals(roleEntity.getId(), roleDTO.getId());
    assertEquals(roleEntity.getName(), roleDTO.getName());
  }

}