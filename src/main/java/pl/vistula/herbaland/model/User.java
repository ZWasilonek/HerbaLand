package pl.vistula.herbaland.model;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.Hibernate;
import pl.vistula.herbaland.model.generic.GenericEntityID;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity(name = "users")
@Getter
@Setter
public class User extends GenericEntityID {

  @NotBlank
  @Column(name = "first_name")
  private String firstName;

  @NotBlank
  @Column(name = "last_name")
  private String lastName;

  @NotBlank
  @Column(name = "password")
  private String password;

  @Email(regexp = "[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,3}")
  @Column(name = "email", unique = true)
  private String email;

  @NotNull
  @Column(name = "is_enabled", columnDefinition = "BIT")
  private boolean isEnabled;

  @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
  @JoinTable(name = "users_authorizations",
      joinColumns = {@JoinColumn(name = "user_id")},
      inverseJoinColumns = {@JoinColumn(name = "authorization_id")})
  private Set<AuthorizationRole> authorizationRoles;

  @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
  @JoinTable(name = "users_plants",
      joinColumns = {@JoinColumn(name = "user_id")},
      inverseJoinColumns = {@JoinColumn(name = "medicinal_plant_id")})
  private Set<MedicinalPlant> medicinalPlants;


  public User() {
    this.authorizationRoles = new HashSet<>();
    this.medicinalPlants = new HashSet<>();
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
    User user = (User) o;
    return getId() != null && Objects.equals(getId(), user.getId());
  }

  @Override
  public int hashCode() {
    return getClass().hashCode();
  }

}