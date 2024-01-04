package pl.vistula.herbaland.service;

import pl.vistula.herbaland.model.MedicinalPlant;
import pl.vistula.herbaland.service.generic.GenericService;

import java.util.Set;

public interface MedicinalPlantService extends GenericService<MedicinalPlant> {

  Set<MedicinalPlant> findSimilarMedicinalPlants(MedicinalPlant medicinalPlant);

  Set<MedicinalPlant> searchByParam(String searchParam);

}