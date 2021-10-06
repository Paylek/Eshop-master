package by.teachmeskills.eshop.service.impl;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.model.Cart;
import by.teachmeskills.eshop.repository.domain.Order;
import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.service.interfacefolder.CartPageService;
import by.teachmeskills.eshop.service.interfacefolder.OrderService;
import by.teachmeskills.eshop.service.interfacefolder.UserService;
import org.apache.log4j.Logger;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public class CartPageServiceImpl implements CartPageService {
    private static final Logger log = Logger.getLogger(CartPageServiceImpl.class);

    @Override
    public Cart saveOrder(Cart cart, UserService userService, User user, OrderService orderService) throws ServiceException {
        try {
            if (Optional.ofNullable(user.getEmail()).isPresent()) {
                int price = (int) cart.getTotalPriceDouble();
                List<Product> prs = cart.getProducts();
                Order order = Order.newBuilder()
                        .withUser(user)
                        .withListOfProducts(prs)
                        .withDate(LocalDate.now())
                        .withPrice(price)
                        .build();
                orderService.create(order);
                cart.getProducts().clear();
                log.info("\nOrder:" + order + "\nUser:" + user + "\nsaved successfully");
            }
            return cart;
        } catch (ServiceException e) {
            log.error(e.getMessage());
            return cart;
        }
    }
}
