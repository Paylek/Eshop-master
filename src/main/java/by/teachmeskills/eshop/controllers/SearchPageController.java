package by.teachmeskills.eshop.controllers;

import by.teachmeskills.eshop.model.Cart;
import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.service.impl.SearchPageServiceImpl;
import by.teachmeskills.eshop.service.interfacefolder.ProductService;
import by.teachmeskills.eshop.service.interfacefolder.SearchPageService;
import org.apache.log4j.Logger;
import org.springframework.data.domain.Page;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import static by.teachmeskills.eshop.PagesPathEnum.SEARCH_PAGE;
import static by.teachmeskills.eshop.RequestParamsEnum.CART;
import static by.teachmeskills.eshop.RequestParamsEnum.MODEL;

@RestController
@RequestMapping("/search")
@SessionAttributes({"cart", "user", "model"})
public class SearchPageController {
    private static final Logger log = Logger.getLogger(SearchPageController.class);

    private final ProductService productService;

    public SearchPageController(ProductService productService) {
        this.productService = productService;
    }

    SearchPageService searchPageService = new SearchPageServiceImpl();

    @GetMapping("/filter")
    public ModelAndView search(String categorySearch,
                               String priceFrom,
                               String priceTo,
                               String search,
                               int pageNum,
                               int size) throws ServiceException {
        log.info("/search/filter/...initializing... \nCategory search:" + categorySearch +
                "\nPrice From:" + priceFrom + "\nPrice To:" + priceTo +
                "\nSearch:" + search + "Page number:" + pageNum + "\nSize:" + size);
        ModelMap model = new ModelMap();
        Page<Product> pages = searchPageService.getPages(categorySearch, priceFrom, priceTo, search, pageNum, size, productService);
        model = searchPageService.getMap(model, pages, categorySearch, pageNum, priceFrom, priceTo, search);
        model.addAttribute("model", model);
        return new ModelAndView(SEARCH_PAGE.getPath(), model);
    }

    @GetMapping("/add")
    public ModelAndView addToCart(Cart cart,
                                  int id,
                                  ModelMap model) throws ServiceException {
        ModelMap modelNew = (ModelMap) model.getAttribute(MODEL.getValue());
        searchPageService.addProductToCart(cart, productService, id);
        modelNew.addAttribute(CART.getValue(), cart);
        return new ModelAndView(SEARCH_PAGE.getPath(), modelNew);
    }
}
