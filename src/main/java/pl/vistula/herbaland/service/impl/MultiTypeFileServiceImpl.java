package pl.vistula.herbaland.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import pl.vistula.herbaland.model.MultiTypeFile;
import pl.vistula.herbaland.repository.MultiTypeFileRepository;
import pl.vistula.herbaland.service.MultiTypeFileService;
import pl.vistula.herbaland.service.generic.GenericServiceImpl;

import java.io.*;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.*;

@Service
public class MultiTypeFileServiceImpl extends GenericServiceImpl<MultiTypeFile, MultiTypeFileRepository>
    implements MultiTypeFileService {

  private static final Path FILE_STORAGE_LOCATION = Paths.get("src/main/resources/META-INF/static/video");
  private static final String HOME_FILE_NAME = "HOME_FILE_NAME";
  private static final String FILE_DESCRIPTION_CSV = "file_description.csv";


  @Autowired
  public MultiTypeFileServiceImpl(MultiTypeFileRepository repository) {
    super(repository);
  }


  @Override
  public MultiTypeFile findByName(String fileName) {
    if (fileName.contains(HOME_FILE_NAME)) {
      return loadHomeFileFromPath(fileName);
    }
    return repository.findByName(fileName);
  }

  @Override
  public Set<MultiTypeFile> loadAllHomeFilesFromPath() {
    Set<MultiTypeFile> homeFiles = new HashSet<>();
    File dir = FILE_STORAGE_LOCATION.toFile();

    File[] candidates = dir.listFiles(new FileFilter() {
      @Override
      public boolean accept(File pathname) {
        return pathname.getName().startsWith(HOME_FILE_NAME);
      }
    });

    if (candidates != null && candidates.length > 0) {
      Arrays.stream(candidates).forEach(candidate -> {
        Path path;
        Resource resource;
        try {
          path = Paths.get(candidate.getPath());
          resource = new UrlResource(path.toUri());
        } catch (MalformedURLException e) {
          throw new RuntimeException(e);
        }

        if (resource.exists() || resource.isReadable()) {
          homeFiles.add(convertPathToMultiTypeFile(path));
        } else {
          throw new RuntimeException("Could not read the file!");
        }
      });
    }
    return homeFiles;
  }

  public MultiTypeFile loadHomeFileFromPath(String fileName) {
    File dir = FILE_STORAGE_LOCATION.toFile();

    File[] candidates = dir.listFiles(new FileFilter() {
      @Override
      public boolean accept(File pathname) {
        return pathname.getName().equals(fileName);
      }
    });

    if (candidates != null && candidates.length > 0) {
      Path path;
      Resource resource;
      try {
        path = Paths.get(candidates[0].getPath());
        resource = new UrlResource(path.toUri());
      } catch (MalformedURLException e) {
        throw new RuntimeException(e);
      }

      if (resource.exists() || resource.isReadable()) {
        return convertPathToMultiTypeFile(path);
      } else {
        throw new RuntimeException("Could not read the file!");
      }
    }
    return null;
  }

  private String getSourceLink(String fileName) {
    String sourceLink = null;

    try (BufferedReader br = new BufferedReader(new FileReader(FILE_STORAGE_LOCATION + "\\" + FILE_DESCRIPTION_CSV))) {
      String line;
      while ((line = br.readLine()) != null) {
        String[] values = line.split(";");
        if (line.contains(fileName)) {
          sourceLink = values[values.length - 1];
          break;
        }
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
    return sourceLink;
  }

  private MultiTypeFile convertPathToMultiTypeFile(Path path) {
    MultiTypeFile file = null;
    String contentType;
    byte[] content;

    try {
      content = Files.readAllBytes(path);
      contentType = Files.probeContentType(path);

      file = new MultiTypeFile();
      file.setName(path.getFileName().toString());
      file.setContent(content);
      file.setContentType(contentType);
      file.setSize(content.length);
      file.setSourceLink(getSourceLink(file.getName()));
    } catch (final IOException e) {
      e.printStackTrace();
    }
    return file;
  }

  @Override
  public void saveFileIntoDir(MultipartFile file, String sourceLink) {
    String homeFileName = HOME_FILE_NAME + "_" + file.getOriginalFilename();
    Path path = Paths.get(FILE_STORAGE_LOCATION + "/" + homeFileName);

    try {
      file.transferTo(path);
      convertFileToCSV(homeFileName, sourceLink);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private void convertFileToCSV(String fileName, String sourceLink) {
    MultiTypeFile found = loadHomeFileFromPath(fileName);
    if (found != null) {
      found.setSourceLink(sourceLink);
      String path = FILE_STORAGE_LOCATION + "/" + FILE_DESCRIPTION_CSV;
      String newFile = "\n" + found.toCSVString();

      try {
        Files.write(Paths.get(path), newFile.getBytes(), StandardOpenOption.APPEND);
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

}