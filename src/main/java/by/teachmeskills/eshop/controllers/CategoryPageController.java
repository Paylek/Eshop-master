package by.teachmeskills.eshop.controllers;


import by.teachmeskills.eshop.repository.domain.Category;
import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.service.impl.CategoryPageServiceImpl;
import by.teachmeskills.eshop.service.interfacefolder.CategoryService;
import by.teachmeskills.eshop.service.interfacefolder.ProductService;
import by.teachmeskills.eshop.model.Cart;
import org.apache.log4j.Logger;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

import static by.teachmeskills.eshop.PagesPathEnum.PRODUCT_PAGE;


@RestController
@RequestMapping("/category")
@SessionAttributes("cart")
public class CategoryPageController {
    private static final Logger log = Logger.getLogger(CategoryPageController.class);

    private final CategoryService categoryService;
    private final ProductService productService;

    public CategoryPageController(CategoryService categoryService, ProductService productService) {
        this.categoryService = categoryService;
        this.productService = productService;
    }

    @GetMapping("/page")
    public ModelAndView getCategoryPagination(int id,
                                              int pageNum,
                                              int size) {
        log.info("/category/page/...initializing...\nCategory id:" + id + "\nPageNum:" + pageNum + "\nsize:" + size);
        ModelMap model = new ModelMap();
        try {
            Pageable pageable = PageRequest.of(pageNum, size, Sort.by("name"));
            Optional<Category> category = categoryService.read(id);
            Page<Product> pages = productService.findAllByCategory_Id(id, pageable);
            category.get().setProductList(pages.getContent());
            model = new CategoryPageServiceImpl().setAttribute(pages, model, pageNum, category.get());
            log.info("/category/page/...initialized...");
        } catch (ServiceException e) {
            log.error(e.getMessage());
        }
        return new ModelAndView(PRODUCT_PAGE.getPath(), model);

    }


    @GetMapping("/add")
    public ModelAndView addToCart(Cart cart,
                                  int id,
                                  int categoryId,
                                  int pageNum,
                                  int size) {
        log.info("/category/add/...initializing..." + "\nCart:" + cart + "\nId product:" + id + "\nId category:" + categoryId + "\nSize:" + size + "\nPageNum:" + pageNum);
        ModelMap model = new ModelMap();
        try {
            Optional<Category> category = categoryService.read(categoryId);
            Optional<Product> product = productService.read(id);
            cart.addProduct(product.get());
            log.info("\nCart:" + cart + "\nupdated:" + cart.getProducts());
            Pageable pageable = PageRequest.of(pageNum, size, Sort.by("name"));
            Page<Product> pages = productService.findAllByCategory_Id(categoryId, pageable);
            category.get().setProductList(pages.getContent());
            model = new CategoryPageServiceImpl().setAttribute(pages, model, pageNum, category.get());
            log.info("\nCategory loaded:" + category.get() + "\n/category/add/...initialized...");
        } catch (ServiceException e) {
            log.error(e.getMessage());
        }
        return new ModelAndView(PRODUCT_PAGE.getPath(), model);
    }
}
