package by.teachmeskills.eshop.service.impl;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.model.Cart;
import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.service.interfacefolder.ProductService;
import by.teachmeskills.eshop.service.interfacefolder.SearchPageService;
import org.apache.log4j.Logger;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.ui.ModelMap;

import java.util.Optional;

public class SearchPageServiceImpl implements SearchPageService {
    private static final Logger log = Logger.getLogger(SearchPageServiceImpl.class);

    @Override
    public Page<Product> getPages(String categorySearch,
                                  String priceFrom,
                                  String priceTo,
                                  String search,
                                  int pageNum,
                                  int size,
                                  ProductService productService) throws ServiceException {
        Pageable pageable = PageRequest.of(pageNum, size, Sort.by("name"));
        if (categorySearch != null) {
            if (categorySearch.equals("All")) {
                categorySearch = null;
            }
        }
        Page<Product> pages = null;
        try {
            pages = productService.searchProducts(categorySearch, priceFrom, priceTo, search, pageable);
            return pages;
        } catch (ServiceException e) {
            log.error(e.getMessage());
            return pages;
        }
    }

    @Override
    public ModelMap getMap(ModelMap model, Page<Product> pages, String categorySearch, int pageNum, String priceFrom, String priceTo, String search) throws ServiceException {
        long second = (pages.getNumber() + 1) * pages.getSize() > pages.getTotalElements() ? pages.getTotalElements() : (pages.getNumber() + 1) * pages.getSize();
        long first = (second - pages.getSize() + 1) > 0 ? second - pages.getSize() + 1 : 1;
        model.addAttribute("first", first);
        model.addAttribute("second", second);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("number", pages.getNumber());
        model.addAttribute("totalPages", pages.getTotalPages());
        model.addAttribute("totalElements", pages.getTotalElements());
        model.addAttribute("size", pages.getSize());
        model.addAttribute("productsPage", pages.getContent());
        model.addAttribute("searchedList", pages.getContent());
        model.addAttribute("priceTo", priceTo);
        model.addAttribute("priceFrom", priceFrom);
        model.addAttribute("categorySearch", categorySearch);
        model.addAttribute("search", search);
        return model;
    }

    @Override
    public Cart addProductToCart(Cart cart, ProductService productService, int id) throws ServiceException {
        try {
            Optional<Product> product = productService.read(id);
            cart.addProduct(product.get());
            return cart;
        } catch (ServiceException e) {
            log.error(e.getMessage());
            return cart;
        }
    }
}
