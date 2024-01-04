package pl.vistula.herbaland.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.vistula.herbaland.model.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

  Category findByName(String categoryName);

}