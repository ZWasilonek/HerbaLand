package pl.vistula.herbaland.service;

import pl.vistula.herbaland.model.Category;
import pl.vistula.herbaland.model.MedicinalPlant;
import pl.vistula.herbaland.model.PlantCategory;
import pl.vistula.herbaland.service.generic.GenericService;

import java.util.Set;

public interface PlantCategoryService extends GenericService<PlantCategory> {

  void saveMedicinalPlantCategories(Integer id, Set<Category> plantCategories);

  Set<Category> getAllCategoriesByPlantId(Integer medicinalPlantId);

  Set<MedicinalPlant> getAllMedicinalPlantsByCategoryId(Integer categoryId);

  void updateMedicinalPlantsCategories(Category category);

}