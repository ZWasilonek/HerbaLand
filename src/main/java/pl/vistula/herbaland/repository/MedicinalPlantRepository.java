package pl.vistula.herbaland.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.vistula.herbaland.model.Category;
import pl.vistula.herbaland.model.MedicinalPlant;

import java.util.Map;
import java.util.Set;

@Repository
public interface MedicinalPlantRepository extends JpaRepository<MedicinalPlant, Integer>,
    MedicinalPlantCustomRepository {

  Map<Integer, Integer> findSimilarMedicinalPlantsByCategories(Set<Category> categories);

  @Query(value = """
      SELECT mp.*
      FROM medicinal_plants AS mp
      WHERE mp.polish_plant_id IN
        (SELECT pmp.id FROM polish_plant_description AS pmp WHERE pmp.name LIKE CONCAT('%',:searchParam,'%'))
        OR mp.latin_plant_id IN
        (SELECT lmp.id FROM latin_plant_description AS lmp WHERE lmp.name LIKE CONCAT('%',:searchParam,'%'))
      OR
      mp.id IN
        (SELECT pmp.medicinal_plant_id FROM plants_categories AS pmp
          WHERE pmp.disease_id IN
          (SELECT d.id FROM diseases AS d WHERE d.name LIKE CONCAT('%',:searchParam,'%'))
          OR
          pmp.working_area_id IN
          (SELECT wa.id FROM working_areas AS wa WHERE wa.name LIKE CONCAT('%',:searchParam,'%'))
        );""",
      nativeQuery = true)
  Set<MedicinalPlant> searchByParam(@Param("searchParam") String searchParam);

}