package pl.vistula.herbaland.model;

import lombok.Getter;
import lombok.Setter;
import pl.vistula.herbaland.model.generic.GenericEntityID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotBlank;

@Entity(name = "polish_plant_description")
@Getter
@Setter
public class PolishPlant extends GenericEntityID {

  @NotBlank
  @Column(name = "name", unique = true)
  private String name;

  @NotBlank
  @Column(name = "family")
  private String family;

  @NotBlank
  @Column(name = "type")
  private String type;

  @NotBlank
  @Column(name = "species")
  private String species;

  @NotBlank
  @Column(name = "raw_material")
  private String rawMaterial;

  @NotBlank
  @Column(name = "active_compounds", columnDefinition = "TEXT")
  private String activeCompounds;

  @NotBlank
  @Column(name = "plant_description", columnDefinition = "TEXT")
  private String plantDescription;

  @NotBlank
  @Column(name = "properties", columnDefinition = "TEXT")
  private String properties;

  @Column(name = "indications", columnDefinition = "TEXT")
  private String indications;

  @Column(name = "comments", columnDefinition = "TEXT")
  private String comments;

  @NotBlank
  @Column(name = "traditional_use", columnDefinition = "TEXT")
  private String traditionalUse;

  @Column(name = "contraindications", columnDefinition = "TEXT")
  private String contraindications;

  @Column(name = "synonyms")
  private String synonyms;

}