package pl.vistula.herbaland.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.vistula.herbaland.dto.CategoryDTO;
import pl.vistula.herbaland.facade.FacadeCategoryService;
import pl.vistula.herbaland.facade.generic.GenericServiceFacadeImpl;
import pl.vistula.herbaland.mapper.CategoryMapper;
import pl.vistula.herbaland.model.Category;
import pl.vistula.herbaland.service.CategoryService;
import pl.vistula.herbaland.service.PlantCategoryService;

import java.util.Random;
import java.util.Set;

@Service
@Transactional
public class FacadeCategoryServiceImpl extends GenericServiceFacadeImpl<Category, CategoryDTO,
    CategoryService, CategoryMapper> implements FacadeCategoryService {

  private final PlantCategoryService plantCategoryService;


  @Autowired
  public FacadeCategoryServiceImpl(CategoryService service, CategoryMapper mapper, PlantCategoryService plantCategoryService) {
    super(service, mapper);
    this.plantCategoryService = plantCategoryService;
  }

  public void saveAndUpdateCategory(CategoryDTO category) {
    /**Poniższe funkcje są stworzone przez to, że zbiór SET po użyciu Mapstruct usuwa elementy,
     * które nie mają jeszcze nadanego id (id = null), bo zostanie on
     * nadany dopiero w bazie danych
     */
    category.getDiseases().forEach(d -> d.getWorkingAreas().stream()
        .filter(wa -> wa.getId() == null)
        .forEach(wa -> wa.setId(generateNegativeRandomInt())));
    category.getDiseases().stream()
        .filter(d -> d.getId() == null)
        .forEach(d -> d.setId(generateNegativeRandomInt()));

    CategoryDTO updated = mapper.mapEntityToDTO(service.saveAndUpdateCategory(
        mapper.mapDTOToEntity(category)));
    plantCategoryService.updateMedicinalPlantsCategories(mapper.mapDTOToEntity(updated));
  }

  @Override
  public CategoryDTO getByName(String categoryName) {
    return mapper.mapEntityToDTO(service.findByName(categoryName));
  }

  @Override
  public Set<CategoryDTO> getAllCategoriesByPlantId(Integer medicinalPlantId) {
    return mapper.mapEntitiesToDTOs(plantCategoryService.getAllCategoriesByPlantId(medicinalPlantId));
  }

  /**
   * Metoda powstała tymczasowo,
   * ponieważ mapstruct przy konwersji obiektów znajdujących się w zbiorze Set,
   * które mają id = null (nowe obiekty) całkowicie je usuwa ze zbioru.
   * Tymczasowe rozwiązanie generuje losową ujemną liczbę dla id,
   * aby wszystkie nowe elementy w kategorii
   * pojawiły się w bazie danych.
   */
  private Integer generateNegativeRandomInt() {
    Random rand = new Random();
    return rand.nextInt(10) - rand.nextInt(1000);
  }

}