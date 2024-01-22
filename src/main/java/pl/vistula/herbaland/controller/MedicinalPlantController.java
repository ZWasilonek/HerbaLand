package pl.vistula.herbaland.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.vistula.herbaland.dto.*;
import pl.vistula.herbaland.facade.*;

import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Set;
import java.util.TreeSet;

@Controller
@RequestMapping("/medicinal-plant")
public class MedicinalPlantController extends SessionController {

  private final static String SELECTED_PLANT_CATEGORY_MODEL_NAME = "selectedCategories";
  private final static String MEDICINAL_PLANT_MODEL_NAME = "medicinalPlant";
  private MedicinalPlantDTO editedMedicinalPlant;
  private Set<CategoryDTO> selectedPlantCategories = new TreeSet<>();
  private final FacadeMedicinalPlantService facadeMedicinalPlantService;
  private final FacadePlantCategoryService facadePlantCategoryService;
  private final FacadeCategoryService facadeCategoryService;
  private final FacadeDiseaseService facadeDiseaseService;
  private final FacadeWorkingAreaService facadeWorkingAreaService;


  @Autowired
  public MedicinalPlantController(FacadeMedicinalPlantService facadeMedicinalPlantService,
                                  FacadePlantCategoryService facadePlantCategoryService,
                                  FacadeCategoryService facadeCategoryService,
                                  FacadeDiseaseService facadeDiseaseService,
                                  FacadeWorkingAreaService facadeWorkingAreaService) {
    this.facadeMedicinalPlantService = facadeMedicinalPlantService;
    this.facadePlantCategoryService = facadePlantCategoryService;
    this.facadeCategoryService = facadeCategoryService;
    this.facadeDiseaseService = facadeDiseaseService;
    this.facadeWorkingAreaService = facadeWorkingAreaService;
  }


  /* START ### MEDICAL PLANT MODEL ###############################################################*/
  @ModelAttribute(MEDICINAL_PLANT_MODEL_NAME)
  public MedicinalPlantDTO initMedicinalPlantModel() {
    editedMedicinalPlant = getMedicinalPlantModel();
    if (editedMedicinalPlant == null) {
      editedMedicinalPlant = new MedicinalPlantDTO();
      httpSession.setAttribute(MEDICINAL_PLANT_MODEL_NAME, editedMedicinalPlant);
    }
    return editedMedicinalPlant;
  }

  private void setMedicinalPlantModel(Model model, MedicinalPlantDTO medicinalPlant) {
    editedMedicinalPlant = medicinalPlant;
    model.addAttribute(MEDICINAL_PLANT_MODEL_NAME, medicinalPlant);
    httpSession.setAttribute(MEDICINAL_PLANT_MODEL_NAME, editedMedicinalPlant);
  }

  private MedicinalPlantDTO getMedicinalPlantModel() {
    return (MedicinalPlantDTO) httpSession.getAttribute(MEDICINAL_PLANT_MODEL_NAME);
  }
  /* END ### MEDICAL PLANT MODEL #################################################################*/


  /* START ### CATEGORY MODEL ####################################################################*/
  @ModelAttribute("allCategories")
  public Set<CategoryDTO> initAllCategoriesModel(Model model) {
    Set<CategoryDTO> allCategories = facadeCategoryService.findAll();
    model.addAttribute("allCategoriesJSON", convertToJson(allCategories));
    return allCategories;
  }

  @ModelAttribute(SELECTED_PLANT_CATEGORY_MODEL_NAME)
  public Set<CategoryDTO> initSelectedCategoriesModel() {
    if (getSelectedPlantCategoriesModel() != null) {
      selectedPlantCategories = getSelectedPlantCategoriesModel();
    } else {
      selectedPlantCategories = new TreeSet<>();
      httpSession.setAttribute(SELECTED_PLANT_CATEGORY_MODEL_NAME, selectedPlantCategories);
    }
    return selectedPlantCategories;
  }

  private Set<CategoryDTO> getSelectedPlantCategoriesModel() {
    return (Set<CategoryDTO>) httpSession.getAttribute(SELECTED_PLANT_CATEGORY_MODEL_NAME);
  }

  private void setSelectedPlantCategoriesModel(Model model, Set<CategoryDTO> selectedCategories) {
    httpSession.setAttribute(SELECTED_PLANT_CATEGORY_MODEL_NAME, selectedCategories);
    model.addAttribute(SELECTED_PLANT_CATEGORY_MODEL_NAME, selectedCategories);
    selectedPlantCategories = selectedCategories;
  }
  /* END ### CATEGORY MODEL ######################################################################*/


  /* START ### DISEASE MODEL #####################################################################*/
  @ModelAttribute("allDiseases")
  public Set<DiseaseDTO> initAllDiseasesModel() {
    return facadeDiseaseService.findAll();
  }
  /* END ### DISEASE MODEL #######################################################################*/


  /* START ### WORKING AREA MODEL ################################################################*/
  @ModelAttribute("allWorkingAreas")
  public Set<WorkingAreaDTO> initAllWorkingAreasModel() {
    return facadeWorkingAreaService.findAll();
  }
  /* END ### WORKING AREA MODEL ##################################################################*/


  /* START ### medicinal-plant.jsp #################################################################*/
  @GetMapping("/{id}")
  public String displayMedicinalPlantById(@PathVariable("id") Integer medicinalPlantId, Model model) {
    setUserFromSession(model, true);
    MedicinalPlantDTO found = facadeMedicinalPlantService.findById(medicinalPlantId);
    setMedicinalPlantModel(model, found);
    setSelectedPlantCategoriesModel(model, found.getCategories());
    model.addAttribute("similarPlants",
        facadeMedicinalPlantService.getSimilarMedicinalPlants(found));
    return "medicinal-plant";
  }
  /* END ### medicinal-plant.jsp ###################################################################*/


  /* START ### form-medicinal-plant.jsp ############################################################*/
  @PostMapping(value = "/send-plant-categories", consumes = "application/json")
  public String addCategoriesToThePlant(@RequestBody Set<CategoryDTO> categories, Model model) {
    if (categories != null && !categories.isEmpty()) {
      setSelectedPlantCategoriesModel(model, categories);
    }
    return "form-medicinal-plant";
  }

  @PostMapping("/send-dialog-category")
  public String sendDialogCategory(@RequestBody CategoryDTO dialogCategory) {
    if (dialogCategory != null) {
      facadeCategoryService.saveAndUpdateCategory(dialogCategory);
    }
    return "form-medicinal-plant";
  }

  //--- START ---------------ADMIN PANEL OPERATIONS---------------------
  @GetMapping("/create/")
  public String displayMedicinalPlantCreateForm(Model model) {
    selectedPlantCategories = new TreeSet<>();
    setUserFromSession(model, true);
    setMedicinalPlantModel(model, new MedicinalPlantDTO());
    model.addAttribute("plantCategoriesJSON", "[]");
    model.addAttribute("editMode", false);
    return "form-medicinal-plant";
  }

  @PostMapping("/create/")
  public String setCreatedMedicinalPlant(@RequestParam("file") MultipartFile file,
                                         @Valid @ModelAttribute("medicinalPlant") MedicinalPlantDTO medicinalPlant,
                                         BindingResult bindingResult,
                                         RedirectAttributes redirectAttrs) {
    String resultView = "form-medicinal-plant";
    if (file != null && !file.isEmpty()) {
      Integer createdId = facadeMedicinalPlantService.getCreatedMedicinalPlantId(medicinalPlant, file);
      if (createdId != null) {
        if (!selectedPlantCategories.isEmpty()) {
          facadePlantCategoryService.saveSelectedPlantCategories(createdId, selectedPlantCategories);
        }
        redirectAttrs.addFlashAttribute("message", "Zapisano nową roślinę");
        resultView = "redirect:/medicinal-plant/" + createdId;
      }
    }
    return resultView;
  }

  @GetMapping("/edit/{id}")
  public String displayMedicinalPlantEditForm(@PathVariable("id") Integer medicinalPlantId,
                                              Model model) {
    MedicinalPlantDTO foundMedicinalPlant = facadeMedicinalPlantService.findById(medicinalPlantId);
    if (foundMedicinalPlant != null) {
      if (foundMedicinalPlant.getCategories() != null && foundMedicinalPlant.getCategories().size() > 0) {
        selectedPlantCategories = foundMedicinalPlant.getCategories();
      } else selectedPlantCategories = new TreeSet<>();
      model.addAttribute("plantCategoriesJSON", convertToJson(selectedPlantCategories));
      setMedicinalPlantModel(model, foundMedicinalPlant);
    }
    setUserFromSession(model, true);
    setSelectedPlantCategoriesModel(model, selectedPlantCategories);
    model.addAttribute("editMode", true);
    return "form-medicinal-plant";
  }

  @PostMapping("/edit/{id}")
  public String setUpdatedMedicinalPlant(@RequestParam("file") MultipartFile file,
                                         @Valid @ModelAttribute("medicinalPlant") MedicinalPlantDTO medicinalPlant,
                                         BindingResult bindingResult,
                                         RedirectAttributes redirectAttrs) {
    MedicinalPlantDTO updated = facadeMedicinalPlantService.updateMedicinalPlant(medicinalPlant, file);
    if (updated != null) {
      if (!selectedPlantCategories.isEmpty()) {
        facadePlantCategoryService.saveSelectedPlantCategories(updated.getId(), selectedPlantCategories);
      }
      redirectAttrs.addFlashAttribute("message", "Dane zostały zaktualizowane");
    }
    return "redirect:/medicinal-plant/" + medicinalPlant.getId();
  }
  //--- END ---------------ADMIN PANEL OPERATIONS---------------------
  /* END ### form-medicinal-plant.jsp ##############################################################*/


  //----------------- BUTTON 'ULUBIONE ZIOŁA' AND ICONS LINKS -----------------
  @GetMapping("/change-favourites/{id}")
  public String addToUserMedicinalPlantsList(@PathVariable("id") Integer medicinalPlantId,
                                             @RequestParam(name = "isPlantAdded") @NotNull Boolean isPlantAdded,
                                             Model model,
                                             RedirectAttributes redirectAttributes,
                                             HttpServletRequest request)
      throws EntityNotFoundException {
    MedicinalPlantDTO foundMedicinalPlant = facadeMedicinalPlantService.findById(medicinalPlantId);
    UserDTO userDTO = getUserFromSession();
    setMedicinalPlantModel(model, foundMedicinalPlant);

    if (isPlantAdded) {
      facadeUserService.addToTheFavouriteMedicinalPlants(userDTO, medicinalPlantId);
      redirectAttributes.addFlashAttribute("addedToFavourite", true);
    } else {
      facadeUserService.removeFromFavouriteMedicinalPlants(userDTO, medicinalPlantId);
      redirectAttributes.addFlashAttribute("addedToFavourite", false);
    }
    setUserFromSession(model, true);
    String referer = request.getHeader("Referer");
    return "redirect:" + referer;
  }


  /* START ### UTILS #############################################################################*/
  private <T> String convertToJson(T object) {
    ObjectWriter ow = new ObjectMapper().writer();
    String json = "{}";
    try {
      json = ow.writeValueAsString(object);
    } catch (JsonProcessingException e) {
      e.printStackTrace();
    }
    return json;
  }
  /* END ### UTILS ###############################################################################*/

}