package pl.vistula.herbaland.service;

import pl.vistula.herbaland.model.Category;
import pl.vistula.herbaland.service.generic.GenericService;

public interface CategoryService extends GenericService<Category> {

  Category saveAndUpdateCategory(Category category);

  Category findByName(String categoryName);

}