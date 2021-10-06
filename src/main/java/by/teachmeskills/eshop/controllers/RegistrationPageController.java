package by.teachmeskills.eshop.controllers;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.service.impl.RegistrationPageServiceImpl;
import by.teachmeskills.eshop.service.interfacefolder.RegistrationPageService;
import by.teachmeskills.eshop.service.interfacefolder.UserService;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import static by.teachmeskills.eshop.PagesPathEnum.REGISTRATION_PAGE;
import static by.teachmeskills.eshop.RequestParamsEnum.*;

@RestController
@RequestMapping("/registration")
@SessionAttributes({"user", "cart"})
public class RegistrationPageController {
    private final UserService userService;
    private final RegistrationPageService registrationPageService;

    public RegistrationPageController(UserService userService, RegistrationPageService registrationPageService) {
        this.userService = userService;
        this.registrationPageService = registrationPageService;
    }

    private static final Logger log = Logger.getLogger(RegistrationPageController.class);

    @GetMapping()
    public ModelAndView getForm() {
        log.info("/registration/...initializing...");
        log.info("/registration/...initialized...");
        return new ModelAndView(REGISTRATION_PAGE.getPath());
    }

    @PostMapping("/add/user")
    public ModelAndView registrationUser(User user, String birthday) throws ServiceException {
        log.info("/registration/add/user/...initializing...");
        ModelAndView modelAndView = new ModelAndView();
        if (registrationPageService.isRegistrateNewUser(user, birthday, userService)) {
            modelAndView.addObject(USER.getValue(), user);
            log.info("/registration/add/user/...initialized...");
            return new ModelAndView(REDIRECT_HOME.getValue());
        } else {
            log.info("/registration/add/user/...not initialized...");
            return new ModelAndView(REDIRECT_REGISTRATION.getValue());
        }
    }
}
