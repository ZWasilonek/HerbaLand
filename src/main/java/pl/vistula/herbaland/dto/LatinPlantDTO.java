package pl.vistula.herbaland.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Getter
@Setter
@Component
public class LatinPlantDTO {

  private Integer id;
  private String name;
  private String family;
  private String type;
  private String species;
  private String rawMaterial;
  private String properties;
  private String synonyms;

  public void setName(String name) {
    this.name = StringUtils.capitalize(name);
  }

  public void setFamily(String family) {
    this.family = StringUtils.capitalize(family);
  }

  public void setType(String type) {
    this.type = StringUtils.capitalize(type);
  }

  public void setSpecies(String species) {
    this.species = StringUtils.capitalize(species);
  }

  public void setRawMaterial(String rawMaterial) {
    this.rawMaterial = StringUtils.capitalize(rawMaterial);
  }

  public void setProperties(String properties) {
    this.properties = StringUtils.capitalize(properties);
  }

  public void setSynonyms(String synonyms) {
    this.synonyms = StringUtils.capitalize(synonyms);
  }

}