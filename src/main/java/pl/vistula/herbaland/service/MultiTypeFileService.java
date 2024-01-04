package pl.vistula.herbaland.service;

import org.springframework.web.multipart.MultipartFile;
import pl.vistula.herbaland.model.MultiTypeFile;
import pl.vistula.herbaland.service.generic.GenericService;

import java.util.Set;

public interface MultiTypeFileService extends GenericService<MultiTypeFile> {

  MultiTypeFile findByName(String fileName);

  void saveFileIntoDir(MultipartFile file, String sourceLink);

  Set<MultiTypeFile> loadAllHomeFilesFromPath();

}