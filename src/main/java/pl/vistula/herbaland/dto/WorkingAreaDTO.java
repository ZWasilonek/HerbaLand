package pl.vistula.herbaland.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Component;

@Getter
@Setter
@EqualsAndHashCode
@Component
public class WorkingAreaDTO implements Comparable<WorkingAreaDTO> {

  private Integer id;
  private String name;

  public void setName(String name) {
    this.name = name.trim();
  }

  @Override
  public int compareTo(@NotNull WorkingAreaDTO o) {
    return name.compareToIgnoreCase(o.getName());
  }

}