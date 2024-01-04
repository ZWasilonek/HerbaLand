package pl.vistula.herbaland.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.vistula.herbaland.model.Disease;
import pl.vistula.herbaland.repository.DiseaseRepository;
import pl.vistula.herbaland.service.DiseaseService;
import pl.vistula.herbaland.service.generic.GenericServiceImpl;

@Service
public class DiseaseServiceImpl extends GenericServiceImpl<Disease, DiseaseRepository>
    implements DiseaseService {

  @Autowired
  public DiseaseServiceImpl(DiseaseRepository repository) {
    super(repository);
  }

}