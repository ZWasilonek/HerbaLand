package pl.vistula.herbaland.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.Set;
import java.util.TreeSet;

@Getter
@Setter
@Component
@Scope("session")
public class MedicinalPlantDTO {

  private Integer id;
  private PolishPlantDTO polishPlant;
  private LatinPlantDTO latinPlant;
  private MultiTypeFileDTO file;
  private String bibliography;
  private String dataSourceLinks;
  private Set<CategoryDTO> categories;
  private Integer percentageMatch;

  /* below object are using only for pretty visibility in form-medicinal-plant */
  private CategoryDTO category;
  private DiseaseDTO disease;
  private WorkingAreaDTO workingArea;


  public MedicinalPlantDTO() {
    this.polishPlant = new PolishPlantDTO();
    this.latinPlant = new LatinPlantDTO();
    this.file = new MultiTypeFileDTO();
    this.categories = new TreeSet<>();

    /* below object are using only for pretty visibility in form-medicinal-plant */
    this.category = new CategoryDTO();
    this.disease = new DiseaseDTO();
    this.workingArea = new WorkingAreaDTO();
  }

}