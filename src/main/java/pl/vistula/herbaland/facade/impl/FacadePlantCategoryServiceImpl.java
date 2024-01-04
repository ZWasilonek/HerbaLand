package pl.vistula.herbaland.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.vistula.herbaland.dto.CategoryDTO;
import pl.vistula.herbaland.facade.FacadePlantCategoryService;
import pl.vistula.herbaland.mapper.CategoryMapper;
import pl.vistula.herbaland.service.PlantCategoryService;

import java.util.Set;

@Service
@Transactional
public class FacadePlantCategoryServiceImpl implements FacadePlantCategoryService {

  private final PlantCategoryService service;


  @Autowired
  public FacadePlantCategoryServiceImpl(PlantCategoryService service) {
    this.service = service;
  }


  @Override
  public void saveSelectedPlantCategories(Integer id, Set<CategoryDTO> selectedPlantCategories) {
    service.saveMedicinalPlantCategories(id, CategoryMapper.INSTANCE.mapDTOsToEntities(selectedPlantCategories));
  }

}