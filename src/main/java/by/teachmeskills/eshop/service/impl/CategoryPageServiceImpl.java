package by.teachmeskills.eshop.service.impl;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.domain.Category;
import by.teachmeskills.eshop.service.interfacefolder.CategoryPageService;
import org.springframework.data.domain.Page;
import org.springframework.ui.ModelMap;

import static by.teachmeskills.eshop.RequestParamsEnum.*;

public class CategoryPageServiceImpl implements CategoryPageService {
    @Override
    public ModelMap setAttribute(Page page, ModelMap model, int pageNum, Category category) throws ServiceException {
        long second = (page.getNumber() + 1) * page.getSize() > page.getTotalElements() ? page.getTotalElements() : (page.getNumber() + 1) * page.getSize();
        long first = (second - page.getSize() + 1) > 0 ? second - page.getSize() + 1 : 1;
        model.addAttribute(FIRST.getValue(), first);
        model.addAttribute(SECOND.getValue(), second);
        model.addAttribute(PAGE_NUMBER.getValue(), pageNum);
        model.addAttribute(ALL_PAGES.getValue(), page.getTotalPages());
        model.addAttribute(ALL_ELEMENTS.getValue(), page.getTotalElements());
        model.addAttribute(SIZE_OF_PAGE.getValue(), page.getSize());
        model.addAttribute(ELEMENTS_ON_PAGE.getValue(), page.getContent());
        model.addAttribute(CATEGORY.getValue(), category);
        return model;
    }
}
