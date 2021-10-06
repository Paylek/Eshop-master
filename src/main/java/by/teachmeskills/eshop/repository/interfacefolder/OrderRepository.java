package by.teachmeskills.eshop.repository.interfacefolder;


import by.teachmeskills.eshop.repository.domain.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {

    @Override
    List<Order> findAll();

    List<Order> findAllByUser_Id(int id);

    List<Order> findAllByUser_IdOrderByIdDesc(int id);
}
