package by.teachmeskills.eshop.controllers;

import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.service.impl.CartPageServiceImpl;
import by.teachmeskills.eshop.service.interfacefolder.OrderService;
import by.teachmeskills.eshop.service.interfacefolder.ProductService;
import by.teachmeskills.eshop.service.interfacefolder.UserService;
import by.teachmeskills.eshop.model.Cart;
import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import static by.teachmeskills.eshop.PagesPathEnum.*;
import static by.teachmeskills.eshop.RequestParamsEnum.*;

@RestController
@RequestMapping("/cart")
@SessionAttributes({"user", "cart", "purchases"})
public class CartPageController {
    private static final Logger log = Logger.getLogger(CartPageController.class);

    private final UserService userService;
    private final OrderService orderService;


    public CartPageController(UserService userService, OrderService orderService, ProductService productService) {
        this.userService = userService;
        this.orderService = orderService;
    }

    @GetMapping()
    public ModelAndView getCartPage(Cart cart) {
        log.info("/cart/...initializing...\nCart:" + cart);
        log.info("/cart/...initialized...");
        return new ModelAndView(CART_PAGE.getPath());
    }

    @GetMapping("/remove")
    public ModelAndView removeProduct(Cart cart, @RequestParam int id) {
        log.info("/cart/remove/...initializing...\nCart:" + cart + "\nId product:" + id);
        ModelMap model = new ModelMap();
        cart.removeProduct(id);
        model.addAttribute(CART.getValue(), cart);
        log.info("/cart/remove...initialized...");
        return new ModelAndView(REDIRECT_CART.getValue(), model);
    }

    @GetMapping("/order")
    public ModelAndView orderProduct(User user, Cart cart) {
        log.info("/cart/order/...initializing...\nCart:" + cart + "\nUser:" + user);
        ModelMap model = new ModelMap();
        try {
            cart = new CartPageServiceImpl().saveOrder(cart, userService, user, orderService);
        } catch (ServiceException e) {
            log.error(e.getMessage());
        }
        model.addAttribute(USER.getValue(), user);
        model.addAttribute(CART.getValue(), cart);
        log.info("/cart/order/...initialized...");
        return new ModelAndView(REDIRECT_CART.getValue(), model);
    }
}
