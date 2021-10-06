package by.teachmeskills.eshop.service.interfacefolder;

import by.teachmeskills.eshop.repository.domain.Category;
import by.teachmeskills.eshop.exceptions.ServiceException;

import java.util.List;


public interface CategoryService extends BaseService<Category> {
    List<Category> getAllCategories() throws ServiceException;

    Category getCategoryByName(String name) throws ServiceException;
}
