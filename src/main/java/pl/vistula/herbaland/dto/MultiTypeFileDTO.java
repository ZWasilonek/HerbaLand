package pl.vistula.herbaland.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.net.URL;

@Getter
@Setter
@Component
public class MultiTypeFileDTO {

  private Integer id;
  private String name;
  private String contentType;
  private long size;
  private byte[] content;
  private String sourceLink;
  private URL uploadFileEndpoint;

}