package pl.vistula.herbaland.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Getter
@Setter
@Component
public class PolishPlantDTO {

  private Integer id;
  private String name;
  private String family;
  private String type;
  private String species;
  private String rawMaterial;
  private String activeCompounds;
  private String plantDescription;
  private String properties;
  private String indications;
  private String comments;
  private String traditionalUse;
  private String contraindications;
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

  public void setActiveCompounds(String activeCompounds) {
    this.activeCompounds = StringUtils.capitalize(activeCompounds);
  }

  public void setPlantDescription(String plantDescription) {
    this.plantDescription = StringUtils.capitalize(plantDescription);
  }

  public void setProperties(String properties) {
    this.properties = StringUtils.capitalize(properties);
  }

  public void setTraditionalUse(String traditionalUse) {
    this.traditionalUse = StringUtils.capitalize(traditionalUse);
  }

  public void setContraindications(String contraindications) {
    this.contraindications = StringUtils.capitalize(contraindications);
  }

  public void setSynonyms(String synonyms) {
    this.synonyms = StringUtils.capitalize(synonyms);
  }

}