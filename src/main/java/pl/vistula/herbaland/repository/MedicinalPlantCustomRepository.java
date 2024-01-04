package pl.vistula.herbaland.repository;

import pl.vistula.herbaland.model.Category;

import java.util.Map;
import java.util.Set;

public interface MedicinalPlantCustomRepository {

  Map<Integer, Integer> findSimilarMedicinalPlantsByCategories(Set<Category> categories);

}