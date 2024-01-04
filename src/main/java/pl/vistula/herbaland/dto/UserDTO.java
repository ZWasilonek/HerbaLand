package pl.vistula.herbaland.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;
import pl.vistula.herbaland.model.AuthorizationRoleType;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Getter
@Setter
@Component
public class UserDTO {

  private Integer id;
  private String firstName;
  private String lastName;
  private String email;
  private String password;
  private String confirmPassword;
  private boolean isEnabled;
  private Set<AuthorizationRoleDTO> authorizationRoles;
  private Set<MedicinalPlantDTO> medicinalPlants;


  public UserDTO() {
    this.medicinalPlants = new HashSet<>();
    this.authorizationRoles = new HashSet<>();
  }


  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName.toUpperCase();
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName.toUpperCase();
  }

  //used in index_a.jsp and medicinal-plant.jsp
  public boolean isAdmin() {
    Optional<AuthorizationRoleDTO> role = authorizationRoles.stream()
        .filter(ar -> AuthorizationRoleType.ROLE_ADMIN.name().equals(ar.getName()))
        .findAny();
    return role.isPresent();
  }

  //used in medicinal-plant.jsp
  public boolean containsPlantInFavorites(MedicinalPlantDTO medicinalPlant) {
    return this.medicinalPlants.stream().anyMatch(mp -> mp.getId().equals(medicinalPlant.getId()));
  }

}