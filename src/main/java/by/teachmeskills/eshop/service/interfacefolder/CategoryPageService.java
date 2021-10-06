package by.teachmeskills.eshop.service.interfacefolder;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.domain.Category;
import org.springframework.data.domain.Page;
import org.springframework.ui.ModelMap;

public interface CategoryPageService {

    ModelMap setAttribute(Page page, ModelMap modelMap, int pageNum, Category category) throws ServiceException;
}
