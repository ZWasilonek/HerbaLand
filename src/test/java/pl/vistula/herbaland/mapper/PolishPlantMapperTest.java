package pl.vistula.herbaland.mapper;


import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import pl.vistula.herbaland.dto.PolishPlantDTO;
import pl.vistula.herbaland.model.PolishPlant;

import java.util.Set;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static pl.vistula.herbaland.util.Mock.getPolishPlant;
import static pl.vistula.herbaland.util.Mock.getPolishPlantDTO;

@SpringBootTest
class PolishPlantMapperTest {

  private final PolishPlant polishPlant = getPolishPlant();
  private final PolishPlantDTO polishPlantDTO = getPolishPlantDTO();
  private final Set<PolishPlant> polishPlants = Set.of(polishPlant);
  private final Set<PolishPlantDTO> polishPlantsDTOs = Set.of(polishPlantDTO);


  @Test
  void shouldMapPolishPlantDTOToEntity() {
    //when
    PolishPlant polishPlant = PolishPlantMapper.INSTANCE.mapDTOToEntity(polishPlantDTO);
    //then
    assertNotNull(polishPlant);
    assertEquals(polishPlant.getId(), polishPlantDTO.getId());
    assertEquals(polishPlant.getName(), polishPlantDTO.getName());
    assertEquals(polishPlant.getFamily(), polishPlantDTO.getFamily());
    assertEquals(polishPlant.getType(), polishPlantDTO.getType());
    assertEquals(polishPlant.getSpecies(), polishPlantDTO.getSpecies());
    assertEquals(polishPlant.getRawMaterial(), polishPlantDTO.getRawMaterial());
    assertEquals(polishPlant.getActiveCompounds(), polishPlantDTO.getActiveCompounds());
    assertEquals(polishPlant.getPlantDescription(), polishPlantDTO.getPlantDescription());
    assertEquals(polishPlant.getProperties(), polishPlantDTO.getProperties());
    assertEquals(polishPlant.getTraditionalUse(), polishPlantDTO.getTraditionalUse());
    assertEquals(polishPlant.getContraindications(), polishPlantDTO.getContraindications());
    assertEquals(polishPlant.getSynonyms(), polishPlantDTO.getSynonyms());
  }

  @Test
  void shouldMapPolishPlantEntityToDTO() {
    //when
    PolishPlantDTO polishPlantDTO = PolishPlantMapper.INSTANCE.mapEntityToDTO(polishPlant);
    //then
    assertNotNull(polishPlantDTO);
    assertEquals(polishPlantDTO.getId(), polishPlant.getId());
    assertEquals(polishPlantDTO.getName(), polishPlant.getName());
    assertEquals(polishPlantDTO.getFamily(), polishPlant.getFamily());
    assertEquals(polishPlantDTO.getType(), polishPlant.getType());
    assertEquals(polishPlantDTO.getSpecies(), polishPlant.getSpecies());
    assertEquals(polishPlantDTO.getRawMaterial(), polishPlant.getRawMaterial());
    assertEquals(polishPlantDTO.getActiveCompounds(), polishPlant.getActiveCompounds());
    assertEquals(polishPlantDTO.getPlantDescription(), polishPlant.getPlantDescription());
    assertEquals(polishPlantDTO.getProperties(), polishPlant.getProperties());
    assertEquals(polishPlantDTO.getTraditionalUse(), polishPlant.getTraditionalUse());
    assertEquals(polishPlantDTO.getContraindications(), polishPlant.getContraindications());
    assertEquals(polishPlantDTO.getSynonyms(), polishPlant.getSynonyms());
  }

  @Test
  void shouldMapPolishPlantsEntitiesToDTOs() {
    //when
    Set<PolishPlantDTO> polishPlantDTOs = PolishPlantMapper.INSTANCE.mapEntitiesToDTOs(polishPlants);
    //then
    assertNotNull(polishPlantDTOs);
    assertEquals(polishPlantDTOs.iterator().next().getId(), polishPlants.iterator().next().getId());
    assertEquals(polishPlantDTOs.iterator().next().getName(), polishPlants.iterator().next().getName());
    assertEquals(polishPlantDTOs.iterator().next().getFamily(), polishPlants.iterator().next().getFamily());
    assertEquals(polishPlantDTOs.iterator().next().getType(), polishPlants.iterator().next().getType());
    assertEquals(polishPlantDTOs.iterator().next().getSpecies(), polishPlants.iterator().next().getSpecies());
    assertEquals(polishPlantDTOs.iterator().next().getRawMaterial(), polishPlants.iterator().next().getRawMaterial());
    assertEquals(polishPlantDTOs.iterator().next().getActiveCompounds(), polishPlants.iterator().next().getActiveCompounds());
    assertEquals(polishPlantDTOs.iterator().next().getPlantDescription(), polishPlants.iterator().next().getPlantDescription());
    assertEquals(polishPlantDTOs.iterator().next().getProperties(), polishPlants.iterator().next().getProperties());
    assertEquals(polishPlantDTOs.iterator().next().getTraditionalUse(), polishPlants.iterator().next().getTraditionalUse());
    assertEquals(polishPlantDTOs.iterator().next().getContraindications(), polishPlants.iterator().next().getContraindications());
    assertEquals(polishPlantDTOs.iterator().next().getSynonyms(), polishPlants.iterator().next().getSynonyms());
  }

  @Test
  void shouldMapPolishPlantsDTOsToEntities() {
    //when
    Set<PolishPlant> polishPlantsEntities = PolishPlantMapper.INSTANCE.mapDTOsToEntities(polishPlantsDTOs);
    //then
    assertNotNull(polishPlantsEntities);
    assertEquals(polishPlantsEntities.iterator().next().getId(), polishPlantsDTOs.iterator().next().getId());
    assertEquals(polishPlantsEntities.iterator().next().getName(), polishPlantsDTOs.iterator().next().getName());
    assertEquals(polishPlantsEntities.iterator().next().getFamily(), polishPlantsDTOs.iterator().next().getFamily());
    assertEquals(polishPlantsEntities.iterator().next().getType(), polishPlantsDTOs.iterator().next().getType());
    assertEquals(polishPlantsEntities.iterator().next().getSpecies(), polishPlantsDTOs.iterator().next().getSpecies());
    assertEquals(polishPlantsEntities.iterator().next().getRawMaterial(), polishPlantsDTOs.iterator().next().getRawMaterial());
    assertEquals(polishPlantsEntities.iterator().next().getActiveCompounds(), polishPlantsDTOs.iterator().next().getActiveCompounds());
    assertEquals(polishPlantsEntities.iterator().next().getPlantDescription(), polishPlantsDTOs.iterator().next().getPlantDescription());
    assertEquals(polishPlantsEntities.iterator().next().getProperties(), polishPlantsDTOs.iterator().next().getProperties());
    assertEquals(polishPlantsEntities.iterator().next().getTraditionalUse(), polishPlantsDTOs.iterator().next().getTraditionalUse());
    assertEquals(polishPlantsEntities.iterator().next().getContraindications(), polishPlantsDTOs.iterator().next().getContraindications());
    assertEquals(polishPlantsEntities.iterator().next().getSynonyms(), polishPlantsDTOs.iterator().next().getSynonyms());
  }
}