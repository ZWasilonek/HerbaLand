package pl.vistula.herbaland.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import pl.vistula.herbaland.dto.CategoryDTO;
import pl.vistula.herbaland.mapper.generic.GenericMapper;
import pl.vistula.herbaland.model.Category;

@Mapper(componentModel = "spring")
public interface CategoryMapper extends GenericMapper<Category, CategoryDTO> {

  CategoryMapper INSTANCE = Mappers.getMapper(CategoryMapper.class);

}