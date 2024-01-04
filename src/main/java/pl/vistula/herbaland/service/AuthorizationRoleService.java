package pl.vistula.herbaland.service;

import pl.vistula.herbaland.model.AuthorizationRole;
import pl.vistula.herbaland.service.generic.GenericService;

public interface AuthorizationRoleService extends GenericService<AuthorizationRole> {

  AuthorizationRole findByName(String name);

}