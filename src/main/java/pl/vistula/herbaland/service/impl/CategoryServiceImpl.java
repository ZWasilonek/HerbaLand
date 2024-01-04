package pl.vistula.herbaland.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.vistula.herbaland.model.Category;
import pl.vistula.herbaland.model.Disease;
import pl.vistula.herbaland.model.WorkingArea;
import pl.vistula.herbaland.repository.CategoryRepository;
import pl.vistula.herbaland.service.CategoryService;
import pl.vistula.herbaland.service.DiseaseService;
import pl.vistula.herbaland.service.WorkingAreaService;
import pl.vistula.herbaland.service.generic.GenericServiceImpl;

@Service
public class CategoryServiceImpl extends GenericServiceImpl<Category, CategoryRepository>
    implements CategoryService {

  private final DiseaseService diseaseService;
  private final WorkingAreaService workingAreaService;


  @Autowired
  public CategoryServiceImpl(CategoryRepository repository,
                             DiseaseService diseaseService,
                             WorkingAreaService workingAreaService) {
    super(repository);
    this.diseaseService = diseaseService;
    this.workingAreaService = workingAreaService;
  }


  @Override
  public Category saveAndUpdateCategory(Category category) {
    if (category.getId() == null || category.getId() < 0) {
      Category newCategory = new Category();
      newCategory.setId(null);
      newCategory.setName(category.getName());
      category.setId(super.create(newCategory).getId());
    }
    for (Disease disease : category.getDiseases()) {
      if (disease.getId() == null || disease.getId() < 0) {
        Disease newDisease = new Disease();
        newDisease.setId(null);
        newDisease.setName(disease.getName());
        disease.setId(diseaseService.create(newDisease).getId());
      }
      for (WorkingArea workingArea : disease.getWorkingAreas()) {
        if (workingArea.getId() == null || workingArea.getId() < 0) {
          WorkingArea newWorkingArea = new WorkingArea();
          newWorkingArea.setId(null);
          newWorkingArea.setName(workingArea.getName());
          workingArea.setId(workingAreaService.create(newWorkingArea).getId());
        }
      }
    }
    return super.update(category);
  }

  @Override
  public Category findByName(String categoryName) {
    return repository.findByName(categoryName);
  }

}