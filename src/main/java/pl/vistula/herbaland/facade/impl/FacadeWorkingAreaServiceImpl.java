package pl.vistula.herbaland.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.vistula.herbaland.dto.WorkingAreaDTO;
import pl.vistula.herbaland.facade.FacadeWorkingAreaService;
import pl.vistula.herbaland.facade.generic.GenericServiceFacadeImpl;
import pl.vistula.herbaland.mapper.WorkingAreaMapper;
import pl.vistula.herbaland.model.WorkingArea;
import pl.vistula.herbaland.service.WorkingAreaService;

import java.util.Set;

@Service
@Transactional
public class FacadeWorkingAreaServiceImpl extends GenericServiceFacadeImpl<WorkingArea, WorkingAreaDTO,
    WorkingAreaService, WorkingAreaMapper> implements FacadeWorkingAreaService {

  @Autowired
  public FacadeWorkingAreaServiceImpl(WorkingAreaService service, WorkingAreaMapper mapper) {
    super(service, mapper);
  }

}