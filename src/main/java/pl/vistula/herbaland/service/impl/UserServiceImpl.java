package pl.vistula.herbaland.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.vistula.herbaland.model.AuthorizationRole;
import pl.vistula.herbaland.model.MedicinalPlant;
import pl.vistula.herbaland.model.User;
import pl.vistula.herbaland.model.AuthorizationRoleType;
import pl.vistula.herbaland.repository.UserRepository;
import pl.vistula.herbaland.service.AuthorizationRoleService;
import pl.vistula.herbaland.service.MedicinalPlantService;
import pl.vistula.herbaland.service.UserService;
import pl.vistula.herbaland.service.generic.GenericServiceImpl;

@Service
public class UserServiceImpl extends GenericServiceImpl<User, UserRepository> implements UserService {

  private final BCryptPasswordEncoder passwordEncoder;
  private final AuthorizationRoleService authorizationRoleService;
  private final MedicinalPlantService medicinalPlantService;


  @Autowired
  public UserServiceImpl(UserRepository repository,
                         BCryptPasswordEncoder passwordEncoder,
                         AuthorizationRoleService authorizationRoleService,
                         MedicinalPlantService medicinalPlantService) {
    super(repository);
    this.passwordEncoder = passwordEncoder;
    this.authorizationRoleService = authorizationRoleService;
    this.medicinalPlantService = medicinalPlantService;
  }


  @Override
  public User findByEmail(String email) {
    return repository.findByEmail(email);
  }

  @Override
  public User create(User user) {
    AuthorizationRole roleUser = authorizationRoleService.findByName
        (AuthorizationRoleType.ROLE_USER.name());
    user.setPassword(passwordEncoder.encode(user.getPassword()));
    user.setEnabled(true);
    user.getAuthorizationRoles().add(roleUser);
    return super.create(user);
  }

  @Override
  public User update(User user) {
    user.setPassword(passwordEncoder.encode(user.getPassword()));
    return super.update(user);
  }

  @Override
  public void addMedicinalPlantToUser(User user, Integer medicinalPlantId) {
    MedicinalPlant found = medicinalPlantService.findById(medicinalPlantId);
    if (found != null) {
      user.getMedicinalPlants().add(found);
      super.update(user);
    }
  }

  @Override
  public void removeMedicinalPlantFromUser(User user, Integer medicinalPlantId) {
    MedicinalPlant found = medicinalPlantService.findById(medicinalPlantId);
    if (found != null) {
      user.getMedicinalPlants().remove(found);
      super.update(user);
    }
  }

}