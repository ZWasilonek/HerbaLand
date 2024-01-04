package pl.vistula.herbaland.model;

import lombok.Getter;
import lombok.Setter;
import pl.vistula.herbaland.model.generic.GenericEntityID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotBlank;

@Entity(name = "latin_plant_description")
@Getter
@Setter
public class LatinPlant extends GenericEntityID {

  @NotBlank
  @Column(unique = true)
  private String name;

  @NotBlank
  private String family;

  @NotBlank
  private String type;

  @NotBlank
  private String species;

  @NotBlank
  private String rawMaterial;

  private String properties;

  private String synonyms;

}