package pl.vistula.herbaland.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import pl.vistula.herbaland.dto.CategoryDTO;
import pl.vistula.herbaland.dto.MedicinalPlantDTO;
import pl.vistula.herbaland.dto.MultiTypeFileDTO;
import pl.vistula.herbaland.facade.FacadeCategoryService;
import pl.vistula.herbaland.facade.FacadeMedicinalPlantService;
import pl.vistula.herbaland.facade.FacadeMultiTypeFileService;
import pl.vistula.herbaland.facade.generic.GenericServiceFacadeImpl;
import pl.vistula.herbaland.mapper.MedicinalPlantMapper;
import pl.vistula.herbaland.model.MedicinalPlant;
import pl.vistula.herbaland.service.MedicinalPlantService;
import pl.vistula.herbaland.service.PlantCategoryService;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
@Transactional
public class FacadeMedicinalPlantServiceImpl extends GenericServiceFacadeImpl<MedicinalPlant, MedicinalPlantDTO,
    MedicinalPlantService, MedicinalPlantMapper> implements FacadeMedicinalPlantService {

  private final FacadeCategoryService facadeCategoryService;
  private final FacadeMultiTypeFileService facadeMultiTypeFileService;
  private final PlantCategoryService plantCategoryService;


  @Autowired
  public FacadeMedicinalPlantServiceImpl(MedicinalPlantService service,
                                         MedicinalPlantMapper mapper,
                                         FacadeCategoryService facadeCategoryService,
                                         FacadeMultiTypeFileService facadeMultiTypeFileService,
                                         PlantCategoryService plantCategoryService) {
    super(service, mapper);
    this.facadeCategoryService = facadeCategoryService;
    this.facadeMultiTypeFileService = facadeMultiTypeFileService;
    this.plantCategoryService = plantCategoryService;
  }


  @Override
  public MedicinalPlantDTO findById(Integer medicinalPlantId) {
    MedicinalPlantDTO medicinalPlant = super.findById(medicinalPlantId);
    return getMedicinalPlantWithCategories(medicinalPlant);
  }

  @Override
  public Page<MedicinalPlantDTO> getAllMedicinalPlantsByCategory(String categoryName, int pageNo, int limit) {
    CategoryDTO foundCategory = facadeCategoryService.getByName(categoryName);
    List<MedicinalPlantDTO> foundMedicinalPlants = new ArrayList<>(mapper.mapEntitiesToDTOs(
        plantCategoryService.getAllMedicinalPlantsByCategoryId(foundCategory.getId())));
    return convertObjectsToPage(foundMedicinalPlants, pageNo, limit);
  }

  @Override
  public Integer getCreatedMedicinalPlantId(MedicinalPlantDTO medicinalPlant, MultipartFile file) {
    medicinalPlant.setFile(facadeMultiTypeFileService.convertFileToDTO(file, medicinalPlant.getFile().getSourceLink()));
    MedicinalPlantDTO created = super.create(medicinalPlant);
    return created.getId();
  }

  @Override
  public Set<MedicinalPlantDTO> getSimilarMedicinalPlants(MedicinalPlantDTO medicinalPlant) {
    return mapper.mapEntitiesToDTOs(service.findSimilarMedicinalPlants(mapper.mapDTOToEntity(medicinalPlant)));
  }

  @Override
  public Page<MedicinalPlantDTO> searchByParam(String searchParam, int pageNo, int limit) {
    List<MedicinalPlantDTO> foundMedicinalPlants = mapper.mapEntitiesToDTOs(
        service.searchByParam(searchParam)).stream().toList();
    return convertObjectsToPage(foundMedicinalPlants, pageNo, limit);
  }

  private MedicinalPlantDTO getMedicinalPlantWithCategories(MedicinalPlantDTO medicinalPlant) {
    Set<CategoryDTO> categories = facadeCategoryService.getAllCategoriesByPlantId(medicinalPlant.getId());
    medicinalPlant.getCategories().addAll(categories);
    return medicinalPlant;
  }

  public MedicinalPlantDTO updateMedicinalPlant(MedicinalPlantDTO medicinalPlant, MultipartFile file) {
    MultiTypeFileDTO found = super.findById(medicinalPlant.getId()).getFile();
    String sourceLink = medicinalPlant.getFile().getSourceLink();

    if (file != null && !file.isEmpty()) {
      medicinalPlant.setFile(facadeMultiTypeFileService.convertFileToDTO(file, medicinalPlant.getFile().getSourceLink()));
      medicinalPlant.getFile().setId(found.getId());
    } else medicinalPlant.setFile(found);

    if (sourceLink != null && !sourceLink.isEmpty())
      medicinalPlant.getFile().setSourceLink(sourceLink);

    MedicinalPlantDTO updated = super.update(medicinalPlant);
    getMedicinalPlantWithCategories(updated);
    return updated;
  }

}