package by.teachmeskills.eshop.controllers;

import by.teachmeskills.eshop.repository.domain.Category;
import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.service.impl.HomePageServiceImpl;
import by.teachmeskills.eshop.service.interfacefolder.CategoryService;
import by.teachmeskills.eshop.model.Cart;
import by.teachmeskills.eshop.service.interfacefolder.HomePageService;
import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import static by.teachmeskills.eshop.PagesPathEnum.*;
import static by.teachmeskills.eshop.RequestParamsEnum.*;

@RestController
@RequestMapping("/home")
@SessionAttributes({"user", "cart", "categories"})
public class HomePageController {
    private final HomePageService homePageService;

    private final CategoryService categoryService;

    public HomePageController(HomePageService homePageService, CategoryService categoryService) {
        this.homePageService = homePageService;
        this.categoryService = categoryService;
    }

    private static final Logger log = Logger.getLogger(HomePageController.class);

    @GetMapping()
    public ModelAndView start(@ModelAttribute("user") User user,
                              @ModelAttribute("cart") Cart cart) {
        log.info("/home/...initializing...\nUser:" + user + "\nCart:" + cart);
        ModelMap model = new ModelMap();
        try {
            homePageService.switchUserNameAccount(user);
            List<Category> categories = categoryService.getAllCategories();
            log.info("Categories downloaded:"+categories.toString());
            model.addAttribute(CATEGORIES.getValue(), categories);
            model.addAttribute(USER.getValue(), user);
            model.addAttribute(CART.getValue(), cart);
            log.info("/home/...initialized...");
        } catch (ServiceException e) {
            log.error(e.getMessage());
        }
        return new ModelAndView(HOME_PAGE.getPath(), model);
    }

    @GetMapping("/new")
    public ModelAndView start() {
        return new ModelAndView("new");
    }
    @ModelAttribute("user")
    public User getUser() {
        return new User();
    }

    @ModelAttribute("cart")
    public Cart getCart() {
        return new Cart();
    }
}
