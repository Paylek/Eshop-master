package by.teachmeskills.eshop.service.impl;

import by.teachmeskills.eshop.repository.domain.Category;
import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.interfacefolder.CategoryRepository;
import by.teachmeskills.eshop.service.interfacefolder.CategoryService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements CategoryService {


    private final CategoryRepository categoryRepository;

    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public void create(Category entity) throws ServiceException {
        categoryRepository.save(entity);
    }

    @Override
    public Optional<Category> read(int id) throws ServiceException {
        return categoryRepository.findById(id);
    }

    @Override
    public void update(Category entity) throws ServiceException {
        categoryRepository.save(entity);
    }

    @Override
    public void delete(Category entity) throws ServiceException {
        categoryRepository.delete(entity);
    }

    @Override
    public List<Category> getAllCategories() throws ServiceException {
        return categoryRepository.findAll();
    }

    @Override
    public Category getCategoryByName(String name) throws ServiceException {
        return categoryRepository.findByName(name);
    }
}
