package by.teachmeskills.eshop.service.interfacefolder;

import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.exceptions.ServiceException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductService extends BaseService<Product> {
    List<Product> getAllProducts() throws ServiceException;

    Product getProductByName(String name) throws ServiceException;

    List<Product> getProductsByCategory(String category) throws ServiceException;

    Page<Product> searchProducts(String category, String priceFrom, String priceTo, String search, Pageable pageable) throws ServiceException;

    List<Product> getProductsById(int id) throws ServiceException;

    Page<Product> findAllByCategory_Id(int id, Pageable pageable) throws ServiceException;
}
