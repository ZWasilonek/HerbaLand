package pl.vistula.herbaland.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Component;

import java.util.Set;
import java.util.TreeSet;

@Getter
@Setter
@EqualsAndHashCode
@Component
public class DiseaseDTO implements Comparable<DiseaseDTO> {

  private Integer id;
  private String name;
  private Set<WorkingAreaDTO> workingAreas;


  public DiseaseDTO() {
    this.workingAreas = new TreeSet<>();
  }


  public void setName(String name) {
    this.name = name.trim();
  }

  @Override
  public int compareTo(@NotNull DiseaseDTO o) {
    return name.compareToIgnoreCase(o.getName());
  }

}