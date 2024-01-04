package pl.vistula.herbaland.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import pl.vistula.herbaland.dto.MultiTypeFileDTO;
import pl.vistula.herbaland.facade.FacadeMultiTypeFileService;
import pl.vistula.herbaland.facade.generic.GenericServiceFacadeImpl;
import pl.vistula.herbaland.mapper.MultiTypeFileMapper;
import pl.vistula.herbaland.model.MultiTypeFile;
import pl.vistula.herbaland.service.MultiTypeFileService;

import java.util.Set;

import static org.springframework.http.ResponseEntity.ok;

@Service
@Transactional
public class FacadeMultiTypeFileServiceImpl extends GenericServiceFacadeImpl<MultiTypeFile, MultiTypeFileDTO,
    MultiTypeFileService, MultiTypeFileMapper> implements FacadeMultiTypeFileService {

  @Autowired
  public FacadeMultiTypeFileServiceImpl(MultiTypeFileService service, MultiTypeFileMapper mapper) {
    super(service, mapper);
  }


  @Override
  public ResponseEntity<?> loadIntoBrowser(String fileName) {
    MultiTypeFileDTO fileDTO = mapper.mapEntityToDTO(service.findByName(fileName));
    if (fileDTO != null && fileDTO.getContentType() != null) {
      byte[] imageByte = fileDTO.getContent();
      return ok().contentType(MediaType.valueOf(fileDTO.getContentType()))
          .body(imageByte);
    }
    return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
  }

  @Override
  public MultiTypeFileDTO convertFileToDTO(MultipartFile multipartFile, String sourceLink) {
    MultiTypeFileDTO converted = mapper.convertFileToDTO(multipartFile);
    if (sourceLink != null) converted.setSourceLink(sourceLink);
    return converted;
  }

  @Override
  public void createHomeFile(MultipartFile file, String sourceLink) {
    if (file != null) {
      service.saveFileIntoDir(file, sourceLink);
    }
  }

  @Override
  public Set<MultiTypeFileDTO> loadHomeFiles() {
    return mapper.mapEntitiesToDTOs(service.loadAllHomeFilesFromPath());
  }

}