package by.teachmeskills.eshop.service.interfacefolder;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.model.Cart;
import by.teachmeskills.eshop.repository.domain.User;

public interface CartPageService {
    Cart saveOrder(Cart cart, UserService userService, User user, OrderService orderService) throws ServiceException;
}
