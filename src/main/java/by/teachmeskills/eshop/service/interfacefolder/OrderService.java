package by.teachmeskills.eshop.service.interfacefolder;

import by.teachmeskills.eshop.repository.domain.Order;
import by.teachmeskills.eshop.exceptions.ServiceException;

import java.util.List;


public interface OrderService extends BaseService<Order> {
    List<Order> getAllOrders() throws ServiceException;

    List<Order> getAllOrdersWithUser(int id) throws ServiceException;

    List<Order> getAllOrdersWithUserDesc(int id) throws ServiceException;
}
