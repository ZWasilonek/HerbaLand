package pl.vistula.herbaland.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.vistula.herbaland.model.PlantCategory;

import java.util.Set;

@Repository
public interface PlantCategoryRepository extends JpaRepository<PlantCategory, Integer> {

  @Modifying
  @Query(value = "DELETE FROM plants_categories AS pc WHERE pc.id=:plantCategoryId", nativeQuery = true)
  int removePlantCategory(@Param("plantCategoryId") Integer plantCategoryId);

  PlantCategory findByMedicinalPlantIdAndCategoryIdAndDiseaseIdAndWorkingAreaId(Integer medicinalPlantId, Integer categoryId, Integer diseaseId, Integer workingAreaId);

  long countByMedicinalPlantIdAndCategoryIdAndDiseaseIdAndWorkingAreaId(Integer medicinalPlantId, Integer categoryId, Integer diseaseId, Integer workingAreaId);

  Set<PlantCategory> findAllByMedicinalPlantId(Integer medicinalPlantId);

  long countByMedicinalPlantId(Integer medicinalPlantId);

  Set<PlantCategory> findDistinctAllByCategoryId(Integer categoryId);

}