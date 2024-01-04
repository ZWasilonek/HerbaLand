package pl.vistula.herbaland.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.Named;
import org.mapstruct.factory.Mappers;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import pl.vistula.herbaland.dto.MultiTypeFileDTO;
import pl.vistula.herbaland.mapper.generic.GenericMapper;
import pl.vistula.herbaland.model.MultiTypeFile;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

@Mapper(componentModel = "spring")
public interface MultiTypeFileMapper extends GenericMapper<MultiTypeFile, MultiTypeFileDTO> {

  MultiTypeFileMapper INSTANCE = Mappers.getMapper(MultiTypeFileMapper.class);

  @Mappings({
      @Mapping(target = "name", source = "originalFilename"),
      @Mapping(target = "contentType", source = "contentType"),
      @Mapping(target = "size", source = "size"),
      @Mapping(target = "content", source = "multipartFile", qualifiedByName = "getBytes")
  })
  MultiTypeFileDTO convertFileToDTO(MultipartFile multipartFile);

  @Mappings({
      @Mapping(target = "id", source = "id"),
      @Mapping(target = "name", source = "name"),
      @Mapping(target = "contentType", source = "contentType"),
      @Mapping(target = "size", source = "size"),
      @Mapping(target = "content", source = "content"),
      @Mapping(target = "sourceLink", source = "sourceLink")
  })
  MultiTypeFile mapDTOToEntity(MultiTypeFileDTO dto);

  @Mappings({
      @Mapping(target = "id", source = "id"),
      @Mapping(target = "name", source = "name"),
      @Mapping(target = "contentType", source = "contentType"),
      @Mapping(target = "size", source = "size"),
      @Mapping(target = "content", source = "content"),
      @Mapping(target = "uploadFileEndpoint", source = "entity", qualifiedByName = "uploadFileEndpoint"),
      @Mapping(target = "sourceLink", source = "sourceLink")
  })
  MultiTypeFileDTO mapEntityToDTO(MultiTypeFile entity);

  @Named("getBytes")
  default byte[] getBytes(MultipartFile multipartFile) {
    byte[] content = null;
    try {
      content = multipartFile.getBytes();
    } catch (IOException e) {
      e.printStackTrace();
    }
    return content;
  }

  @Named("uploadFileEndpoint")
  default URL createFileURL(MultiTypeFile file) throws IOException {
    URL fileURL = null;
    try {
      fileURL = new URL(ServletUriComponentsBuilder.fromCurrentContextPath()
          .path("/file/show/")
          .path(file.getName())
          .toUriString());
    } catch (MalformedURLException e) {
      new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    return fileURL;
  }

}