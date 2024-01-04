package pl.vistula.herbaland.service.impl;

import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.vistula.herbaland.model.*;
import pl.vistula.herbaland.model.generic.GenericEntityID;
import pl.vistula.herbaland.repository.PlantCategoryRepository;
import pl.vistula.herbaland.service.MedicinalPlantService;
import pl.vistula.herbaland.service.PlantCategoryService;
import pl.vistula.herbaland.service.generic.GenericServiceImpl;

import java.util.*;
import java.util.concurrent.ConcurrentSkipListSet;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.stream.Collectors;

@Service
public class PlantCategoryServiceImpl extends GenericServiceImpl<PlantCategory, PlantCategoryRepository>
    implements PlantCategoryService {

  private final MedicinalPlantService medicinalPlantService;


  @Autowired
  public PlantCategoryServiceImpl(PlantCategoryRepository repository,
                                  MedicinalPlantService medicinalPlantService) {
    super(repository);
    this.medicinalPlantService = medicinalPlantService;
  }


  @Override //TODO -refactoring przetwarzanie po wysłaniu trwa zbyt długo !
  public void saveMedicinalPlantCategories(Integer medicinalPlantId, Set<Category> plantCategories) {
    long plantCategoriesAmount = repository.countByMedicinalPlantId(medicinalPlantId);
    MedicinalPlant foundMedicinalPlant = medicinalPlantService.findById(medicinalPlantId);
    Set<PlantCategory> foundPlantCategories = repository.findAllByMedicinalPlantId(medicinalPlantId);

    if (plantCategoriesAmount > 0) {
      Integer categoryId, diseaseId, workingAreaId;
      boolean shouldRemove;
      for (PlantCategory plantCategoryFromDB : foundPlantCategories) {
        shouldRemove = checkIfCategoryItemNotExistsById(
            plantCategories, plantCategoryFromDB.getCategory().getId());
        if (shouldRemove) {
          super.remove(plantCategoryFromDB);
          continue;
        }
        for (Category category : plantCategories) {
          categoryId = category.getId();
          shouldRemove = plantCategoryFromDB.getCategory().getId().equals(categoryId) &&
              checkIfCategoryItemNotExistsById(
                  category.getDiseases(), plantCategoryFromDB.getDisease().getId());
          if (shouldRemove) {
            if (removePlantCategory(plantCategoryFromDB.getId())) continue;
            else {
              //TODO - zgłość błąd
            }
          }
          for (Disease disease : category.getDiseases()) {
            diseaseId = disease.getId();
            shouldRemove = plantCategoryFromDB.getCategory().getId().equals(categoryId) &&
                plantCategoryFromDB.getDisease().getId().equals(diseaseId) &&
                checkIfCategoryItemNotExistsById(
                    disease.getWorkingAreas(), plantCategoryFromDB.getWorkingArea().getId());
            if (shouldRemove) {
              if (removePlantCategory(plantCategoryFromDB.getId())) continue;
              else {
                //TODO - zgłość błąd
              }
            }
            for (WorkingArea workingArea : disease.getWorkingAreas()) {
              workingAreaId = workingArea.getId();
              boolean checkIfExistsInDB = repository.countByMedicinalPlantIdAndCategoryIdAndDiseaseIdAndWorkingAreaId(
                  medicinalPlantId, categoryId, diseaseId, workingAreaId) != 0;
              if (!checkIfExistsInDB) { // przypisz nową kategorię do rośliny
                PlantCategory newPlantCategory = new PlantCategory();
                newPlantCategory.setMedicinalPlant(foundMedicinalPlant);
                newPlantCategory.setCategory(category);
                newPlantCategory.setDisease(disease);
                newPlantCategory.setWorkingArea(workingArea);
                super.create(newPlantCategory);
              } else {
                PlantCategory foundPlantCategory = repository.findByMedicinalPlantIdAndCategoryIdAndDiseaseIdAndWorkingAreaId(
                    medicinalPlantId, categoryId, diseaseId, workingAreaId);
                foundPlantCategory.setCategory(category);
                foundPlantCategory.setDisease(disease);
                foundPlantCategory.setWorkingArea(workingArea);
                super.update(foundPlantCategory);
              }
            }
          }
        }
      }
    } else { //no category have been assigned to the medicinal plant
      for (Category category : plantCategories) {
        for (Disease disease : category.getDiseases()) {
          for (WorkingArea workingArea : disease.getWorkingAreas()) {
            PlantCategory newPlantCategory = new PlantCategory();
            newPlantCategory.setMedicinalPlant(foundMedicinalPlant);
            newPlantCategory.setCategory(category);
            newPlantCategory.setDisease(disease);
            newPlantCategory.setWorkingArea(workingArea);
            super.create(newPlantCategory);
          }
        }
      }
    }
  }

  private boolean removePlantCategory(Integer plantCategoryId) {
    int isRemoved = repository.removePlantCategory(plantCategoryId);
    return isRemoved == 1;
  }

  @Override
  public Set<Category> getAllCategoriesByPlantId(Integer medicinalPlantId) {
    Set<Category> resultCategories = new ConcurrentSkipListSet<>();
    Set<PlantCategory> foundPlantCategories = new CopyOnWriteArraySet<>(repository.findAllByMedicinalPlantId(medicinalPlantId));

    if (foundPlantCategories.size() > 0) {
      for (PlantCategory plantCategoryFromDB : foundPlantCategories) {
        Category categoryFromDB = getCategory(plantCategoryFromDB);

        if (resultCategories.size() == 0 || checkIfCategoryItemNotExistsById(resultCategories, categoryFromDB.getId())) {
          Category DBCategory = getCategory(plantCategoryFromDB);
          resultCategories.add(DBCategory);
        } else {
          resultCategories.stream()
              .filter(c -> c.getId().equals(categoryFromDB.getId()))
              .forEach(c -> {
                boolean shouldAddDisease = c.getDiseases() == null
                    || c.getDiseases().size() == 0
                    || checkIfCategoryItemNotExistsById(c.getDiseases(), plantCategoryFromDB.getDisease().getId());
                if (shouldAddDisease) {
                  Category DBCategory = getCategory(plantCategoryFromDB);
                  c.getDiseases().addAll(DBCategory.getDiseases());
                } else {
                  c.getDiseases().stream()
                      .filter(d -> d.getId().equals(plantCategoryFromDB.getDisease().getId()))
                      .forEach(d -> {
                        boolean shouldAddWorkingAreas = d.getWorkingAreas() == null
                            || d.getWorkingAreas().size() == 0
                            || checkIfCategoryItemNotExistsById(d.getWorkingAreas(), plantCategoryFromDB.getWorkingArea().getId());
                        if (shouldAddWorkingAreas) {
                          d.getWorkingAreas().add(plantCategoryFromDB.getWorkingArea());
                        }
                      });
                }
              });
        }
      }
    }
    return new TreeSet<>(resultCategories);
  }

  @Override
  public Set<MedicinalPlant> getAllMedicinalPlantsByCategoryId(Integer categoryId) {
    return repository.findDistinctAllByCategoryId(categoryId).stream()
        .map(PlantCategory::getMedicinalPlant)
        .collect(Collectors.toCollection(TreeSet::new));
  }

  /**
   * check whether the database categories (@param category)
   * include a category assigned to the plant (plantsCategoriesByCategoryId),
   * if not, remove it from the categories assigned to plants
   */
  @Override
  public void updateMedicinalPlantsCategories(Category category) {
    Set<PlantCategory> plantsCategoriesByCategoryId = repository.findDistinctAllByCategoryId(category.getId());
    plantsCategoriesByCategoryId.forEach(pc -> {
      boolean shouldRemoveDisease = checkIfCategoryItemNotExistsById(
          category.getDiseases(), pc.getDisease().getId());
      if (shouldRemoveDisease) {
        repository.removePlantCategory(pc.getId());
      } else {
        category.getDiseases().forEach(d -> {
          boolean shouldRemoveWA = Objects.equals(d.getId(), pc.getDisease().getId())
              && checkIfCategoryItemNotExistsById(d.getWorkingAreas(), pc.getWorkingArea().getId());
          if(shouldRemoveWA) {
            repository.removePlantCategory(pc.getId());
          }
        });
      }
    });
  }

  private <T extends GenericEntityID> boolean checkIfCategoryItemNotExistsById(Set<T> categoryItem, Integer id) {
    Optional<T> foundCategoryItem = categoryItem.stream()
        .filter(item -> item.getId().equals(id))
        .findAny();
    return foundCategoryItem.isEmpty();
  }

  @NotNull
  private Category getCategory(PlantCategory plantCategory) {
    Category category = new Category();
    category.setId(plantCategory.getCategory().getId());
    category.setName(plantCategory.getCategory().getName());

    Disease disease = new Disease();
    disease.setId(plantCategory.getDisease().getId());
    disease.setName(plantCategory.getDisease().getName());
    disease.getWorkingAreas().add(plantCategory.getWorkingArea());
    category.getDiseases().add(disease);
    return category;
  }

}