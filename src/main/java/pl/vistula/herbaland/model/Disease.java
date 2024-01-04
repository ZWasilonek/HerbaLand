package pl.vistula.herbaland.model;

import lombok.Getter;
import lombok.Setter;
import org.jetbrains.annotations.NotNull;
import pl.vistula.herbaland.model.generic.GenericEntityID;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Set;
import java.util.TreeSet;

@Entity(name = "diseases")
@Getter
@Setter
public class Disease extends GenericEntityID implements Comparable<Disease> {

  @NotBlank
  @Column(unique = true)
  private String name;

  @ManyToMany(fetch = FetchType.EAGER)
  @JoinTable(name = "disease_working_areas",
      joinColumns = {@JoinColumn(name = "disease_id")},
      inverseJoinColumns = {@JoinColumn(name = "working_area_id")})
  private Set<WorkingArea> workingAreas;


  public Disease() {
    this.workingAreas = new TreeSet<>();
  }


  @Override
  public int compareTo(@NotNull Disease o) {
    return name.compareToIgnoreCase(o.getName());
  }

}