package pl.vistula.herbaland.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.vistula.herbaland.dto.DiseaseDTO;
import pl.vistula.herbaland.facade.FacadeDiseaseService;
import pl.vistula.herbaland.facade.generic.GenericServiceFacadeImpl;
import pl.vistula.herbaland.mapper.DiseaseMapper;
import pl.vistula.herbaland.model.Disease;
import pl.vistula.herbaland.service.DiseaseService;

@Service
@Transactional
public class FacadeDiseaseServiceImpl extends GenericServiceFacadeImpl<Disease, DiseaseDTO,
    DiseaseService, DiseaseMapper> implements FacadeDiseaseService {

  @Autowired
  public FacadeDiseaseServiceImpl(DiseaseService service, DiseaseMapper mapper) {
    super(service, mapper);
  }

}