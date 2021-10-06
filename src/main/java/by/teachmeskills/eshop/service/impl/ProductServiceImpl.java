package by.teachmeskills.eshop.service.impl;

import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.interfacefolder.ProductRepository;
import by.teachmeskills.eshop.repository.interfacefolder.SearchProductsRepository;
import by.teachmeskills.eshop.service.interfacefolder.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {
    private final ProductRepository productRepository;
    private final SearchProductsRepository searchProductsRepository;

    public ProductServiceImpl(ProductRepository productRepository, SearchProductsRepository searchProductsRepository) {
        this.productRepository = productRepository;
        this.searchProductsRepository = searchProductsRepository;
    }

    @Override
    public void create(Product entity) throws ServiceException {
        productRepository.save(entity);
    }

    @Override
    public Optional<Product> read(int id) throws ServiceException {
        return productRepository.findById(id);
    }

    @Override
    public void update(Product entity) throws ServiceException {
        productRepository.save(entity);
    }

    @Override
    public void delete(Product entity) throws ServiceException {
        productRepository.delete(entity);
    }

    @Override
    public List<Product> getAllProducts() throws ServiceException {
        return productRepository.findAll();
    }

    @Override
    public Product getProductByName(String name) throws ServiceException {
        return productRepository.findByName(name);
    }

    @Override
    public List<Product> getProductsByCategory(String category) throws ServiceException {
        return productRepository.findAllByCategory_Name(category);
    }

    @Override
    public Page<Product> searchProducts(String category, String priceFrom, String priceTo, String search, Pageable pageable) throws ServiceException {
        return searchProductsRepository.findProductsListByParams(category, priceFrom, priceTo, search, pageable);
    }

    @Override
    public List<Product> getProductsById(int id) throws ServiceException {
        return productRepository.findAllByCategory_Id(id);
    }

    @Override
    public Page<Product> findAllByCategory_Id(int id, Pageable pageable) throws ServiceException {
        return productRepository.findAllByCategory_Id(id, pageable);
    }
}
