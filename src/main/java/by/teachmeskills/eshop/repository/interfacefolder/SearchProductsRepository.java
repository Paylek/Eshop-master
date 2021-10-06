package by.teachmeskills.eshop.repository.interfacefolder;

import by.teachmeskills.eshop.repository.domain.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;


public interface SearchProductsRepository {
    Page<Product> findProductsListByParams(String category, String priceFrom, String priceTo, String search, Pageable pageable);
}
