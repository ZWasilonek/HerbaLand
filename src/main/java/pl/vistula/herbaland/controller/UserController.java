package pl.vistula.herbaland.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.vistula.herbaland.dto.MedicinalPlantDTO;
import pl.vistula.herbaland.dto.UserDTO;
import pl.vistula.herbaland.validation.RegistrationValidation;

import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController extends SessionController {

  private final RegistrationValidation validation;


  @Autowired
  public UserController(RegistrationValidation validation) {
    this.validation = validation;
  }


  /* START ### user-medicinal-plants.jsp #########################################################*/
  //------------------USER FAVOURITE HERBALS---------------------
  @GetMapping("/herbs-list")
  public String displayUsersMedicinalPlants(Model model,
                                            @RequestParam(name = "page", defaultValue = "0") int page,
                                            @RequestParam(name = "size", defaultValue = "4") int size) {
    setUserFromSession(model, true);
    Page<MedicinalPlantDTO> userMedicinalPlants = facadeUserService.convertObjectsToPage(
        getUserFromSession().getMedicinalPlants().stream().toList(), page, size);
    model.addAttribute("userMedicinalPlantsPage", userMedicinalPlants);
    return "user-medicinal-plants";
  }
  /* END ### user-medicinal-plants.jsp ###########################################################*/


  /* START ### user-edit-form.jsp ################################################################*/
  @GetMapping("/edit")
  public String displayUserData(Model model) {
    UserDTO userFromSession = getUserFromSession();
    userFromSession.setPassword("");
    userFromSession.setConfirmPassword("");
    model.addAttribute("userFromSession", userFromSession);
    return "user-panel";
  }

  @PostMapping("/edit")
  public String updateUserData(@Valid @ModelAttribute("userFromSession") UserDTO userFromSession,
                               BindingResult bindingResult, Model model) {
    validation.validate(userFromSession, bindingResult);
    if (!bindingResult.hasErrors()) {
      facadeUserService.update(userFromSession);
      model.addAttribute("userModificationStatus", "SUCCESS");
    }
    return "user-panel";
  }
  /* END ### user-edit-form.jsp ##################################################################*/

}