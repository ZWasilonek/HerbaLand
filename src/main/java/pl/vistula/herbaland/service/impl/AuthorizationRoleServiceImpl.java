package pl.vistula.herbaland.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.vistula.herbaland.model.AuthorizationRole;
import pl.vistula.herbaland.repository.AuthorizationRoleRepository;
import pl.vistula.herbaland.service.AuthorizationRoleService;
import pl.vistula.herbaland.service.generic.GenericServiceImpl;

@Service
public class AuthorizationRoleServiceImpl extends GenericServiceImpl<AuthorizationRole, AuthorizationRoleRepository>
    implements AuthorizationRoleService {

  @Autowired
  public AuthorizationRoleServiceImpl(AuthorizationRoleRepository repository) {
    super(repository);
  }

  @Override
  public AuthorizationRole findByName(String roleName) {
    return repository.findByName(roleName);
  }

}