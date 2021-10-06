package by.teachmeskills.eshop.service.interfacefolder;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.model.Cart;
import by.teachmeskills.eshop.repository.domain.Product;
import org.springframework.data.domain.Page;
import org.springframework.ui.ModelMap;

public interface SearchPageService {
    Page<Product> getPages(String categorySearch,
                           String priceFrom,
                           String priceTo,
                           String search,
                           int pageNum,
                           int size,
                           ProductService productService) throws ServiceException;

    ModelMap getMap(ModelMap model,
                    Page<Product> pages,
                    String categorySearch,
                    int pageNum,
                    String priceFrom,
                    String priceTo,
                    String search) throws ServiceException;

    Cart addProductToCart(Cart cart, ProductService productService, int id) throws ServiceException;
}
