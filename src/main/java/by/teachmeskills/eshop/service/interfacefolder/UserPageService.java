package by.teachmeskills.eshop.service.interfacefolder;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.model.Cart;
import by.teachmeskills.eshop.repository.domain.User;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

public interface UserPageService {
    ModelAndView switchLogInIntoAccount(User user, Cart cart, OrderService orderService) throws ServiceException;

    boolean isPassAndLoginValidate(User user,
                                   BindingResult bindingResult,
                                   ModelAndView modelAndView) throws ServiceException;

}
