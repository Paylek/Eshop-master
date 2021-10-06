package by.teachmeskills.eshop.service.impl;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.model.Cart;
import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.service.interfacefolder.OrderService;
import by.teachmeskills.eshop.service.interfacefolder.UserPageService;
import by.teachmeskills.eshop.service.interfacefolder.UserService;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

import static by.teachmeskills.eshop.PagesPathEnum.SIGN_IN_PAGE;
import static by.teachmeskills.eshop.PagesPathEnum.USER_ACCOUNT;
import static by.teachmeskills.eshop.RequestParamsEnum.*;

@Component
public class UserPageServiceImpl implements UserPageService {

    @Override
    public ModelAndView switchLogInIntoAccount(User user, Cart cart, OrderService orderService) throws ServiceException {
        ModelMap model = new ModelMap();
        if (user.getName().equals("log in")) {
            return new ModelAndView(SIGN_IN_PAGE.getPath());
        } else {
            model.addAttribute(PURCHASES.getValue(), cart.findAllPurchases(user, orderService));
            return new ModelAndView(USER_ACCOUNT.getPath(), model);
        }
    }

    @Override
    public boolean isPassAndLoginValidate(User user, BindingResult bindingResult, ModelAndView modelAndView) throws ServiceException {
        if (!Optional.ofNullable(user).isPresent()
                || !Optional.ofNullable(user.getEmail()).isPresent()
                || !Optional.ofNullable(user.getPassword()).isPresent()) {
            if (bindingResult.hasErrors()) {
                populateError("email", modelAndView, bindingResult);
                populateError("password", modelAndView, bindingResult);
                return false;
            }
            return false;
        } else {
            return true;
        }
    }

    private void populateError(String field, ModelAndView model, BindingResult bindingResult) {
        if (bindingResult.hasFieldErrors(field)) {
            model.addObject(field + "Error", bindingResult.getFieldError(field)
                    .getDefaultMessage());
        }
    }
}
