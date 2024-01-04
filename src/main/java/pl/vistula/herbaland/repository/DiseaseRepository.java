package pl.vistula.herbaland.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.vistula.herbaland.model.Disease;

@Repository
public interface DiseaseRepository extends JpaRepository<Disease, Integer> {
}