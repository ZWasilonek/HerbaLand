package pl.vistula.herbaland.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.vistula.herbaland.facade.FacadeMultiTypeFileService;

@Controller
@RequestMapping("file")
public class MultiTypeFileController {

  private final FacadeMultiTypeFileService facadeMultiTypeFileService;


  @Autowired
  public MultiTypeFileController(FacadeMultiTypeFileService facadeMultiTypeFileService) {
    this.facadeMultiTypeFileService = facadeMultiTypeFileService;
  }


  @PostMapping("/send")
  public String setHomeFile(@RequestParam("file") MultipartFile file,
                            @RequestParam("sourceLink") String sourceLink) {
    facadeMultiTypeFileService.createHomeFile(file, sourceLink);
    return "redirect:/";
  }

  @GetMapping("/show/{fileName}")
  public ResponseEntity<?> displayFileByFileName(@PathVariable("fileName") String fileName) {
    return facadeMultiTypeFileService.loadIntoBrowser(fileName);
  }

}