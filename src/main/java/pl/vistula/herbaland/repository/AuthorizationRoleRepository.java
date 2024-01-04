package pl.vistula.herbaland.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.vistula.herbaland.model.AuthorizationRole;

@Repository
public interface AuthorizationRoleRepository extends JpaRepository<AuthorizationRole, Integer> {

  AuthorizationRole findByName(String roleName);

}