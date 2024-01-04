package pl.vistula.herbaland.facade;

import pl.vistula.herbaland.dto.CategoryDTO;

import java.util.Set;

public interface FacadePlantCategoryService {

  void saveSelectedPlantCategories(Integer id, Set<CategoryDTO> selectedPlantCategories);

}