package pl.vistula.herbaland.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.vistula.herbaland.model.MedicinalPlant;
import pl.vistula.herbaland.repository.MedicinalPlantRepository;
import pl.vistula.herbaland.service.MedicinalPlantService;
import pl.vistula.herbaland.service.generic.GenericServiceImpl;

import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

@Service
public class MedicinalPlantServiceImpl extends GenericServiceImpl<MedicinalPlant, MedicinalPlantRepository> implements MedicinalPlantService {

  @Autowired
  public MedicinalPlantServiceImpl(MedicinalPlantRepository repository) {
    super(repository);
  }


  @Override
  public Set<MedicinalPlant> findSimilarMedicinalPlants(MedicinalPlant medicinalPlant) {
    Set<MedicinalPlant> similarMedicinalPlants = new LinkedHashSet<>();
    Map<Integer, Integer> medicinalPlantsData = repository.findSimilarMedicinalPlantsByCategories(medicinalPlant.getCategories());
    for (Map.Entry<Integer, Integer> medicinalPlantData : medicinalPlantsData.entrySet()) {
      if (!medicinalPlantData.getKey().equals(medicinalPlant.getId())) {
        MedicinalPlant foundMedicinalPlant = super.findById(medicinalPlantData.getKey());
        foundMedicinalPlant.setPercentageMatch(medicinalPlantData.getValue());
        similarMedicinalPlants.add(foundMedicinalPlant);
      }
    }
    return similarMedicinalPlants;
  }

  @Override
  public Set<MedicinalPlant> searchByParam(String searchParam) {
    return new TreeSet<>(repository.searchByParam(searchParam));
  }

}