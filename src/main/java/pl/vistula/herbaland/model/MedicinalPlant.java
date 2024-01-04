package pl.vistula.herbaland.model;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.Hibernate;
import org.jetbrains.annotations.NotNull;
import pl.vistula.herbaland.model.generic.GenericEntityID;

import javax.persistence.*;
import java.util.Objects;
import java.util.Set;
import java.util.TreeSet;

@Entity(name = "medicinal_plants")
@Getter
@Setter
public class MedicinalPlant extends GenericEntityID implements Comparable<MedicinalPlant> {

  @OneToOne(cascade = CascadeType.ALL)
  private PolishPlant polishPlant;

  @OneToOne(cascade = CascadeType.ALL)
  private LatinPlant latinPlant;

  @OneToOne(cascade = CascadeType.ALL)
  private MultiTypeFile file;

  @Column
  private String bibliography;

  @Column
  private String dataSourceLinks;

  @Transient
  private Integer percentageMatch;

  @Transient
  private Set<Category> categories;


  public MedicinalPlant() {
    this.polishPlant = new PolishPlant();
    this.latinPlant = new LatinPlant();
    this.file = new MultiTypeFile();
    this.categories = new TreeSet<>();
  }


  @Override
  public int compareTo(@NotNull MedicinalPlant o) {
    return polishPlant.getName().compareToIgnoreCase(o.getPolishPlant().getName());
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
    MedicinalPlant that = (MedicinalPlant) o;
    return getId() != null && Objects.equals(getId(), that.getId());
  }

  @Override
  public int hashCode() {
    return getClass().hashCode();
  }

}