package by.teachmeskills.eshop.repository.interfacefolder;

import by.teachmeskills.eshop.repository.domain.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;


import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer>, PagingAndSortingRepository<Product, Integer> {
    @Override
    List<Product> findAll();

    List<Product> findAllByCategory_Name(String name);

    Product findByName(String name);

    List<Product> findAllByCategory_Id(int id);

    Page<Product> findAllByCategory_Id(int id, Pageable pageable);

}
