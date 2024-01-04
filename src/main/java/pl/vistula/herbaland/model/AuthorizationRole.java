package pl.vistula.herbaland.model;

import lombok.Getter;
import lombok.Setter;
import pl.vistula.herbaland.model.generic.GenericEntityID;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity(name = "authorizations")
@Getter
@Setter
public class AuthorizationRole extends GenericEntityID {

  @Column(unique = true)
  private String name;

}