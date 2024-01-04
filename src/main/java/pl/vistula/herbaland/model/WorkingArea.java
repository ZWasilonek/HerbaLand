package pl.vistula.herbaland.model;

import lombok.Getter;
import lombok.Setter;
import org.jetbrains.annotations.NotNull;
import pl.vistula.herbaland.model.generic.GenericEntityID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotBlank;

@Entity(name = "working_areas")
@Getter
@Setter
public class WorkingArea extends GenericEntityID implements Comparable<WorkingArea> {

  @NotBlank
  @Column(unique = true)
  private String name;


  @Override
  public int compareTo(@NotNull WorkingArea o) {
    return name.compareToIgnoreCase(o.getName());
  }

}