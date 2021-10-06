package by.teachmeskills.eshop.repository.interfacefolder;

import by.teachmeskills.eshop.repository.domain.Category;
import by.teachmeskills.eshop.repository.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
    Category findByName(String name);

    @Override
    List<Category> findAll();
}
