package pl.vistula.herbaland.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.vistula.herbaland.model.MultiTypeFile;

@Repository
public interface MultiTypeFileRepository extends JpaRepository<MultiTypeFile, Integer> {

  MultiTypeFile findByName(String fileName);

}