package pl.vistula.herbaland.model;

import lombok.Getter;
import lombok.Setter;
import org.jetbrains.annotations.NotNull;
import pl.vistula.herbaland.model.generic.GenericEntityID;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Set;
import java.util.TreeSet;

@Entity(name = "categories")
@Getter
@Setter
public class Category extends GenericEntityID implements Comparable<Category> {

  @NotBlank
  @Column(unique = true)
  private String name;

  @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
  @JoinTable(name = "diseases_categories",
      joinColumns = {@JoinColumn(name = "category_id")},
      inverseJoinColumns = {@JoinColumn(name = "disease_id")})
  private Set<Disease> diseases;


  public Category() {
    this.diseases = new TreeSet<>();
  }


  @Override
  public int compareTo(@NotNull Category o) {
    return name.compareToIgnoreCase(o.getName());
  }

}