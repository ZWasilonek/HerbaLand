package pl.vistula.herbaland.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.vistula.herbaland.dto.UserDTO;
import pl.vistula.herbaland.facade.FacadeUserService;
import pl.vistula.herbaland.facade.generic.GenericServiceFacadeImpl;
import pl.vistula.herbaland.mapper.UserMapper;
import pl.vistula.herbaland.model.User;
import pl.vistula.herbaland.service.SecurityService;
import pl.vistula.herbaland.service.UserService;

@Service
public class FacadeUserServiceImpl extends GenericServiceFacadeImpl<User, UserDTO, UserService, UserMapper>
    implements FacadeUserService {

  private final SecurityService securityService;


  @Autowired
  public FacadeUserServiceImpl(UserService service, UserMapper mapper,
                               SecurityService securityService) {
    super(service, mapper);
    this.securityService = securityService;
  }


  @Override
  public UserDTO findUserByEmail(String userEmail) {
    return mapper.mapEntityToDTO(service.findByEmail(userEmail));
  }

  @Override
  public void addToTheFavouriteMedicinalPlants(UserDTO userDTO, Integer medicinalPlantId) {
    service.addMedicinalPlantToUser(mapper.mapDTOToEntity(userDTO), medicinalPlantId);
  }

  @Override
  public void removeFromFavouriteMedicinalPlants(UserDTO userDTO, Integer medicinalPlantId) {
    service.removeMedicinalPlantFromUser(mapper.mapDTOToEntity(userDTO), medicinalPlantId);
  }

  @Override
  public boolean register(UserDTO userDTO) {
    UserDTO registered = mapper.mapEntityToDTO(service.create(mapper.mapDTOToEntity(userDTO)));
    if (registered != null) {
      securityService.autoLogin(registered.getEmail(), userDTO.getConfirmPassword());
      return true;
    }
    return false;
  }

}