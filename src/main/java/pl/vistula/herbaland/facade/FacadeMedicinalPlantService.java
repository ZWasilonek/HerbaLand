package pl.vistula.herbaland.facade;

import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;
import pl.vistula.herbaland.dto.MedicinalPlantDTO;
import pl.vistula.herbaland.facade.generic.GenericServiceFacade;

import java.util.Set;

public interface FacadeMedicinalPlantService extends GenericServiceFacade<MedicinalPlantDTO> {

  MedicinalPlantDTO findById(Integer medicinalPlantId);

  Page<MedicinalPlantDTO> getAllMedicinalPlantsByCategory(String categoryName, int pageNo, int limit);

  Integer getCreatedMedicinalPlantId(MedicinalPlantDTO medicinalPlant, MultipartFile file);

  MedicinalPlantDTO updateMedicinalPlant(MedicinalPlantDTO medicinalPlant, MultipartFile file);

  Set<MedicinalPlantDTO> getSimilarMedicinalPlants(MedicinalPlantDTO medicinalPlant);

  Page<MedicinalPlantDTO> searchByParam(String searchParam, int pageNo, int limit);

}