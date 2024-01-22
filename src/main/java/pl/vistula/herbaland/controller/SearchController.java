package pl.vistula.herbaland.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.vistula.herbaland.dto.CategoryDTO;
import pl.vistula.herbaland.dto.MedicinalPlantDTO;
import pl.vistula.herbaland.dto.MultiTypeFileDTO;
import pl.vistula.herbaland.facade.FacadeCategoryService;
import pl.vistula.herbaland.facade.FacadeMedicinalPlantService;
import pl.vistula.herbaland.facade.FacadeMultiTypeFileService;

import javax.servlet.http.HttpServletRequest;
import java.util.Set;

@Controller
public class SearchController {

  private final FacadeMedicinalPlantService facadeMedicinalPlantService;
  private final FacadeCategoryService facadeCategoryService;
  private final FacadeMultiTypeFileService facadeMultiTypeFileService;


  @Autowired
  public SearchController(FacadeMedicinalPlantService facadeMedicinalPlantService,
                          FacadeCategoryService facadeCategoryService,
                          FacadeMultiTypeFileService facadeMultiTypeFileService) {
    this.facadeMedicinalPlantService = facadeMedicinalPlantService;
    this.facadeCategoryService = facadeCategoryService;
    this.facadeMultiTypeFileService = facadeMultiTypeFileService;
  }


  /* START ### MODELS ###############################################################*/
  @ModelAttribute("homeVideo")
  public MultiTypeFileDTO initHomeVideoModel() {
    return facadeMultiTypeFileService.loadHomeFiles().stream().findFirst().orElse(new MultiTypeFileDTO());
  }

  @ModelAttribute("allCategories")
  public Set<CategoryDTO> initAllCategoriesModel() {
    return facadeCategoryService.findAll();
  }
  /* END ### MODELS #################################################################*/


  /* START ### navigation.jsp, searched.jsp #########################################*/
  @GetMapping("/search")
  public String getMedicinalPlantsByParam(@RequestParam(name = "searchParam") String searchParam,
                                          @RequestParam(name = "page", defaultValue = "0") int page,
                                          @RequestParam(name = "size", defaultValue = "4") int size,
                                          RedirectAttributes redirectAttrs,
                                          HttpServletRequest request) {
    String searchStatus = "NOT_FOUND";
    String referer = request.getHeader("Referer");
    if (!searchParam.isBlank()) {
      Page<MedicinalPlantDTO> searched = facadeMedicinalPlantService.searchByParam(
          searchParam, page, size);
      if (searched != null && searched.getTotalElements() > 0) {
        searchStatus = "SUCCESS";
        redirectAttrs.addFlashAttribute("searchedMedicinalPlants",
            searched.getContent().stream().toList());
        redirectAttrs.addFlashAttribute("pagesNumber", searched.getNumber());
        redirectAttrs.addFlashAttribute("lastPageIndex", searched.getTotalPages() - 1);
        redirectAttrs.addFlashAttribute("previousPageNumberIndex", searched.hasPrevious() ? searched.previousPageable().getPageNumber() : -1);
        redirectAttrs.addFlashAttribute("nextPageNumberIndex", searched.hasNext() ? searched.nextPageable().getPageNumber() : -1);
        redirectAttrs.addFlashAttribute("selectedPageNo", searched.getNumber() != 0 ? searched.getNumber() + 1 : null);
        redirectAttrs.addFlashAttribute
            ("endpointParams", "&searchParam=" + searchParam);
      }
    }
    redirectAttrs.addFlashAttribute("searchParamStatus", searchStatus);
    redirectAttrs.addFlashAttribute("searchWord", searchParam);
    return "redirect:" + referer;
  }
  /* END ### navigation.jsp, searched ###############################################*/


  /* START ### index.jsp ############################################################*/
  @GetMapping("/search-all-by/category/{name}")
  public String getMedicinalPlantsByCategory(@PathVariable("name") String categoryName,
                                             @RequestParam(name = "page", defaultValue = "0") int page,
                                             @RequestParam(name = "size", defaultValue = "8") int size,
                                             Model model) {
    Page<MedicinalPlantDTO> medicinalPlantsPage = null;
    String searchStatus = "NOT_FOUND";
    if (categoryName != null) {
      if (categoryName.equals("all")) {
        medicinalPlantsPage = facadeMedicinalPlantService.findAll(page, size);
        categoryName = "Wszystkie";
      } else {
        medicinalPlantsPage = facadeMedicinalPlantService.getAllMedicinalPlantsByCategory(
            categoryName, page, size);
      }
      if (medicinalPlantsPage != null && medicinalPlantsPage.getTotalElements() > 0) searchStatus = "SUCCESS";
    }
    model.addAttribute("medicinalPlantByCategoryPage", medicinalPlantsPage);
    model.addAttribute("categoryName", categoryName);
    model.addAttribute("searchStatus", searchStatus);
    return "index";
  }
  /* END ### index.jsp ##############################################################*/

}