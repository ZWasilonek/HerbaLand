package pl.vistula.herbaland.model;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.Hibernate;
import pl.vistula.herbaland.model.generic.GenericEntityID;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.util.Objects;

@Entity(name = "plants_categories")
@Getter
@Setter
public class PlantCategory extends GenericEntityID {

  @ManyToOne
  private MedicinalPlant medicinalPlant;

  @ManyToOne
  Category category;

  @ManyToOne
  Disease disease;

  @ManyToOne
  WorkingArea workingArea;


  public PlantCategory() {
    this.medicinalPlant = new MedicinalPlant();
    this.category = new Category();
    this.disease = new Disease();
    this.workingArea = new WorkingArea();
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
    PlantCategory that = (PlantCategory) o;
    return getId() != null && Objects.equals(getId(), that.getId());
  }

  @Override
  public int hashCode() {
    return getClass().hashCode();
  }

}