package pl.vistula.herbaland.facade;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import pl.vistula.herbaland.dto.MultiTypeFileDTO;

import java.util.Set;

public interface FacadeMultiTypeFileService {

  ResponseEntity<?> loadIntoBrowser(String fileName);

  MultiTypeFileDTO convertFileToDTO(MultipartFile multipartFile, String sourceLink);

  void createHomeFile(MultipartFile file, String sourceLink);

  Set<MultiTypeFileDTO> loadHomeFiles();

}