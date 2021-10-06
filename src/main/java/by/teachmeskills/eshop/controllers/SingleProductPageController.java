package by.teachmeskills.eshop.controllers;

import by.teachmeskills.eshop.repository.domain.Category;
import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.service.interfacefolder.CategoryService;
import by.teachmeskills.eshop.service.interfacefolder.ProductService;
import by.teachmeskills.eshop.model.Cart;
import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

import static by.teachmeskills.eshop.PagesPathEnum.SINGLE_PRODUCT_PAGE;
import static by.teachmeskills.eshop.RequestParamsEnum.*;

@RestController
@RequestMapping("/product")
@SessionAttributes("cart")
public class SingleProductPageController {
    private static final Logger log = Logger.getLogger(SingleProductPageController.class);

    private final ProductService productService;
    private final CategoryService categoryService;

    public SingleProductPageController(ProductService productService, CategoryService categoryService) {
        this.productService = productService;
        this.categoryService = categoryService;
    }

    @GetMapping
    public ModelAndView getCategory(@RequestParam int id, @RequestParam int categoryId) {
        log.info("Product page initializing...\nCategory id:" + categoryId + "\nProduct id:" + id);
        ModelMap model = new ModelMap();
        try {
            Optional<Product> product = productService.read(id);
            Optional<Category> category = categoryService.read(categoryId);
            model.addAttribute(PRODUCT.getValue(), product.get());
            model.addAttribute(CATEGORY.getValue(),category.get());
            log.info("Product page initialized.");
        } catch (ServiceException e) {
            log.error(e.getMessage());
        }
        return new ModelAndView(SINGLE_PRODUCT_PAGE.getPath(), model);
    }

    @GetMapping("/add")
    public ModelAndView addToCart(Cart cart, int id, int categoryId) {
        log.info("Add to cart..." + "\nCart:" + cart + "\nId product:" + id + "\nId category:" + categoryId);
        ModelMap model = new ModelMap();
        try {
            Optional<Category> category = categoryService.read(categoryId);
            Optional<Product> product = productService.read(id);
            cart.addProduct(product.get());
            log.info("\nCart:" + cart + "\nupdated:" + cart.getProducts());
            model.addAttribute(CART.getValue(), cart);
            model.addAttribute(PRODUCT.getValue(), product.get());
            model.addAttribute(CATEGORY.getValue(), category.get());
            log.info("Product page initialized.");
        } catch (ServiceException e) {
            log.error(e.getMessage());
        }
        return new ModelAndView(SINGLE_PRODUCT_PAGE.getPath(), model);
    }
}
