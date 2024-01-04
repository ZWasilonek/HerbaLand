package pl.vistula.herbaland.facade;

import pl.vistula.herbaland.dto.CategoryDTO;
import pl.vistula.herbaland.facade.generic.GenericServiceFacade;

import java.util.Set;

public interface FacadeCategoryService extends GenericServiceFacade<CategoryDTO> {

  void saveAndUpdateCategory(CategoryDTO category);

  Set<CategoryDTO> getAllCategoriesByPlantId(Integer medicinalPlantId);

  CategoryDTO getByName(String categoryName);

}