package pl.vistula.herbaland.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.vistula.herbaland.model.WorkingArea;

@Repository
public interface WorkingAreaRepository extends JpaRepository<WorkingArea, Integer> {
}