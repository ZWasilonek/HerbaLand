package pl.vistula.herbaland.service;

import pl.vistula.herbaland.model.User;
import pl.vistula.herbaland.service.generic.GenericService;

public interface UserService extends GenericService<User> {

  User findByEmail(String email);

  void addMedicinalPlantToUser(User user, Integer medicinalPlantId);

  void removeMedicinalPlantFromUser(User user, Integer medicinalPlantId);

}