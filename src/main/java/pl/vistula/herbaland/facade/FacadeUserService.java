package pl.vistula.herbaland.facade;

import pl.vistula.herbaland.dto.UserDTO;
import pl.vistula.herbaland.facade.generic.GenericServiceFacade;

public interface FacadeUserService extends GenericServiceFacade<UserDTO> {

  UserDTO findUserByEmail(String userEmail);

  boolean register(UserDTO userDTO);

  void addToTheFavouriteMedicinalPlants(UserDTO userDTO, Integer medicinalPlantId);

  void removeFromFavouriteMedicinalPlants(UserDTO userDTO, Integer medicinalPlantId);

}