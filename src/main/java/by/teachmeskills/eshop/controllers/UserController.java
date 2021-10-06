package by.teachmeskills.eshop.controllers;


import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.service.impl.UserPageServiceImpl;
import by.teachmeskills.eshop.service.interfacefolder.OrderService;
import by.teachmeskills.eshop.service.interfacefolder.UserService;
import by.teachmeskills.eshop.model.Cart;

import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;


import static by.teachmeskills.eshop.PagesPathEnum.*;
import static by.teachmeskills.eshop.RequestParamsEnum.*;

@RestController
@RequestMapping("/user")
@SessionAttributes({"user", "purchases", "cart"})
@Validated
public class UserController {
    private static final Logger log = Logger.getLogger(UserController.class);

    private final UserService userService;
    private final OrderService orderService;

    public UserController(UserService userService, OrderService orderService) {
        this.userService = userService;
        this.orderService = orderService;
    }

    @GetMapping(value = "/show")
    public ModelAndView openLoginPage(User user, Cart cart) {
        log.info("/user/show/...initializing..." + "\nUser:" + user + "\nCart:" + cart);
        try {
            log.info("/user/show/...initialized...");
            return new UserPageServiceImpl().switchLogInIntoAccount(user, cart, orderService);
        } catch (ServiceException e) {
            log.error(e.getMessage());
            return new ModelAndView(SIGN_IN_PAGE.getPath());
        }
    }

    @PostMapping(value = "/login")
    public ModelAndView login(User user,
                              BindingResult bindingResult,
                              Cart cart,
                              ModelAndView modelAndView) {
        log.info("/user/login/...initializing..." + "\nUser:" + user + "\nCart:" + cart);
        ModelMap model = new ModelMap();
        String warning = "Password or email is not correct!";
        try {
            if (new UserPageServiceImpl().isPassAndLoginValidate(user, bindingResult, modelAndView)) {
                user = userService.getUserByEmailAndPass(user.getEmail(), user.getPassword());
                log.info("Loaded user:" + user);
            }
            if (user == null) {
                model.addAttribute(WARNING.getValue(), warning);
            }
            if (user != null) {
                model.addAttribute(USER.getValue(), user);
                model.addAttribute(PURCHASES.getValue(), cart.findAllPurchases(user, orderService));
                log.info("/user/login/...initialized:" + user);
                return new ModelAndView(USER_ACCOUNT.getPath(), model);
            } else return new ModelAndView(SIGN_IN_PAGE.getPath(), model);
        } catch (ServiceException e) {
            log.error(e.getMessage());
            return new ModelAndView(SIGN_IN_PAGE.getPath());
        }
    }

    @GetMapping(value = "/logout")
    public ModelAndView logOut(SessionStatus status) {
        status.setComplete();
        log.info("/user/logout/...initialized...");
        return new ModelAndView(REDIRECT_HOME.getValue());
    }
}
