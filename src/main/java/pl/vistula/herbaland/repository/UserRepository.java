package pl.vistula.herbaland.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.vistula.herbaland.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

  @Query(value = """
      SELECT u.id, email, first_name, last_name, password, is_enabled
      FROM users AS u
      WHERE u.email=:email AND u.is_enabled=true""", nativeQuery = true)
  User findByEmail(@Param("email") String email);

}