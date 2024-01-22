package pl.vistula.herbaland.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.vistula.herbaland.dto.CategoryDTO;
import pl.vistula.herbaland.dto.MedicinalPlantDTO;
import pl.vistula.herbaland.dto.MultiTypeFileDTO;
import pl.vistula.herbaland.dto.UserDTO;
import pl.vistula.herbaland.facade.*;
import pl.vistula.herbaland.model.MedicinalPlant;
import pl.vistula.herbaland.validation.RegistrationValidation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Optional;
import java.util.Set;

@Controller
@SessionAttributes("userFromSession")
public class HomeController extends SessionController {
  private final FacadeMedicinalPlantService facadeMedicinalPlantService;
  private final RegistrationValidation validator;
  private final FacadeCategoryService facadeCategoryService;
  private final FacadeMultiTypeFileService facadeMultiTypeFileService;


  @Autowired
  public HomeController(FacadeMedicinalPlantService facadeMedicinalPlantService,
                        RegistrationValidation validator,
                        FacadeCategoryService facadeCategoryService,
                        FacadeMultiTypeFileService facadeMultiTypeFileService) {
    this.facadeMedicinalPlantService = facadeMedicinalPlantService;
    this.validator = validator;
    this.facadeCategoryService = facadeCategoryService;
    this.facadeMultiTypeFileService = facadeMultiTypeFileService;
  }


  /* START ### MODELS ###############################################################*/
  @ModelAttribute("homeVideo")
  public MultiTypeFileDTO initHomeVideoModel() {
    Optional<MultiTypeFileDTO> lastVideo = facadeMultiTypeFileService.loadHomeFiles().stream().reduce((first, second) -> second);
    return lastVideo.orElseGet(MultiTypeFileDTO::new);
  }

  @ModelAttribute("allCategories")
  public Set<CategoryDTO> initAllCategoriesModel() {
    return facadeCategoryService.findAll();
  }
  /* END ### MODELS #################################################################*/


  /* START ### index.jsp ############################################################*/
  @GetMapping("/")
  public String displayHomePage(Model model,
                                @RequestParam(name = "page", defaultValue = "0") int page,
                                @RequestParam(name = "size", defaultValue = "8") int size) {
    setUserFromSession(model, true);
    String searchStatus = "NOT_FOUND";

    Page<MedicinalPlantDTO> foundMedicinalPlants = facadeMedicinalPlantService.findAll(page, size);
    if (foundMedicinalPlants != null && foundMedicinalPlants.getTotalElements() > 0) searchStatus = "SUCCESS";

    model.addAttribute("medicinalPlantByCategoryPage", foundMedicinalPlants);
    model.addAttribute("searchStatus", searchStatus);
    return "index";
  }
  /* END ### index.jsp ##############################################################*/


  /* START ### register.jsp #########################################################*/
  @GetMapping("/register")
  public String displayRegistration(Model model) {
    model.addAttribute("registeredUser", new UserDTO());
    return "register";
  }

  @PostMapping("/register")
  public String setRegisteredUser(@Valid @ModelAttribute("registeredUser") UserDTO userDTO,
                                  BindingResult bindingResult) {
    validator.validate(userDTO, bindingResult);
    if (bindingResult.hasErrors()) return "register";
    facadeUserService.register(userDTO);
    return "redirect:/";
  }
  /* END ### register.jsp ###########################################################*/


  /* START ### login.jsp ############################################################*/
  @GetMapping("/login")
  public String displayLoginPage(Model model) {
    model.addAttribute("loginUser", new UserDTO());
    return "login";
  }
  /* END ### login.jsp ##############################################################*/


  /* START ### error.jsp ############################################################*/
  @GetMapping("/403")
  public String displayError(Model model) {
    setUserFromSession(model, true);
    model.addAttribute("status", 403);
    return "error";
  }
  /* END ### error.jsp ##############################################################*/

}