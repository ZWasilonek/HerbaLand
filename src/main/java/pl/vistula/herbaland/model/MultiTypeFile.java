package pl.vistula.herbaland.model;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.Hibernate;
import pl.vistula.herbaland.model.generic.GenericEntityID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import java.net.URL;
import java.util.Objects;

@Entity(name = "files")
@Getter
@Setter
public class MultiTypeFile extends GenericEntityID {

  @NotBlank
  @Column(name = "file_name")
  private String name;

  @NotBlank
  @Column(name = "file_type")
  private String contentType;

  @Column(name = "size", nullable = false)
  private long size;

  @Lob
  @Column(name = "data")
  private byte[] content;

  @Column(name = "source_link", nullable = false)
  private String sourceLink;

  @Transient
  private URL uploadFileEndpoint;

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
    MultiTypeFile that = (MultiTypeFile) o;
    return getId() != null && Objects.equals(getId(), that.getId());
  }

  @Override
  public int hashCode() {
    return getClass().hashCode();
  }

  public String toCSVString() {
    return name + ';' + contentType + ';' + size + ';' + sourceLink;
  }

}