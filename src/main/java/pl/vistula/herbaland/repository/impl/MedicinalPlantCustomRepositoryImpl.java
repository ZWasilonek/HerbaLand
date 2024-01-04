package pl.vistula.herbaland.repository.impl;

import pl.vistula.herbaland.model.Category;
import pl.vistula.herbaland.repository.MedicinalPlantCustomRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;

public class MedicinalPlantCustomRepositoryImpl implements MedicinalPlantCustomRepository {

  private final String categoryIdParam = ":category_id";
  private final String diseaseIdParam = ":disease_id";
  private final String workingAreaIdParam = ":working_area_id";
  private final String medicinalPlantCategoriesParam = ":medicinalPlantCategoriesQuery";
  private final String categoryPartOfQuery = """
      (pc.category_id=:category_id AND pc.disease_id=:disease_id
      AND pc.working_area_id=:working_area_id)""";
  private final String findSimilarMedicinalPlantsIdsByCategoriesQuery = "SELECT\n" +
      "pc.medicinal_plant_id,\n" +
      "COUNT(pc.category_id) AS categoryOccurrence\n" +
      "FROM\n" +
      "plants_categories AS pc\n" +
      "WHERE\n" +
      medicinalPlantCategoriesParam + "\n" +
      "GROUP BY\n" +
      "pc.medicinal_plant_id\n" +
      "ORDER BY\n" +
      "categoryOccurrence DESC\n" +
      "LIMIT 6;";

  @PersistenceContext
  private EntityManager entityManager;

  @Override
  public Map<Integer, Integer> findSimilarMedicinalPlantsByCategories(Set<Category> categories) {
    Map<Integer, Integer> medicinalPlantsData = new LinkedHashMap<>();
    Optional<Map.Entry<Integer, List<Object[]>>> found = getFirstMapEntry(categories);

    if (found.isPresent()) {
      List<Object[]> results = found.get().getValue();

      if (results != null && results.size() > 0) {
        results.forEach(result -> {
          int numberOfMatches = Integer.parseInt(result[1].toString());
          Integer percentValue = numberOfMatches * 100 / found.get().getKey();
          medicinalPlantsData.put((Integer) result[0], percentValue);
        });
      }
    }
    return medicinalPlantsData;
  }

  private Optional<Map.Entry<Integer, List<Object[]>>> getFirstMapEntry(Set<Category> categories) {
    if (!categories.isEmpty()) {
      Map<Integer, List<Object[]>> foundSqlResults = findByCategories(categories);
      return foundSqlResults.entrySet()
          .stream()
          .findFirst();
    }
    return Optional.empty();
  }

  private Map<Integer, List<Object[]>> findByCategories(Set<Category> categories) {
    Map<Integer, List<Object[]>> sqlResults = new LinkedHashMap<>();
    StringJoiner joiner = new StringJoiner(" OR \n");

    AtomicReference<Integer> categorySize = new AtomicReference<>(0);

    categories.forEach(c -> {
      String categoryId = String.valueOf(c.getId());
      c.getDiseases().forEach(d -> {
        String diseaseId = String.valueOf(d.getId());
        d.getWorkingAreas().forEach(wa -> {
          String workingAreaId = String.valueOf(wa.getId());
          String categoriesQueries = categoryPartOfQuery
              .replace(categoryIdParam, categoryId)
              .replace(diseaseIdParam, diseaseId)
              .replace(workingAreaIdParam, workingAreaId);
          joiner.add(categoriesQueries);
          categorySize.getAndSet(categorySize.get() + 1);
        });
      });
    });

    String medicinalPlantCategoriesQuery = joiner.toString();
    String sqlQuery = findSimilarMedicinalPlantsIdsByCategoriesQuery
        .replace(medicinalPlantCategoriesParam, medicinalPlantCategoriesQuery);

    Query query = entityManager.createNativeQuery(sqlQuery);

    List<Object[]> results = query.getResultList();
    sqlResults.put(categorySize.get(), results);
    return sqlResults;
  }

}