package pl.vistula.herbaland.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.vistula.herbaland.model.WorkingArea;
import pl.vistula.herbaland.repository.WorkingAreaRepository;
import pl.vistula.herbaland.service.WorkingAreaService;
import pl.vistula.herbaland.service.generic.GenericServiceImpl;

@Service
public class WorkingAreaServiceImpl extends GenericServiceImpl<WorkingArea, WorkingAreaRepository>
    implements WorkingAreaService {

  @Autowired
  public WorkingAreaServiceImpl(WorkingAreaRepository repository) {
    super(repository);
  }

}