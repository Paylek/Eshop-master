package by.teachmeskills.eshop.service.impl;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.service.interfacefolder.RegistrationPageService;
import by.teachmeskills.eshop.service.interfacefolder.UserService;
import by.teachmeskills.eshop.utils.Validation;
import by.teachmeskills.eshop.utils.ValidationImpl;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Optional;

@Service
public class RegistrationPageServiceImpl implements RegistrationPageService {
    private static final Logger log = Logger.getLogger(RegistrationPageServiceImpl.class);


    @Override
    public Boolean isRegistrateNewUser(User user, String birthday, UserService userService) throws ServiceException {
        if (Optional.ofNullable(user).isPresent()) {
            LocalDate localDate = LocalDate.parse(birthday);
            user.setDateOfBirthday(localDate);
            Validation validation = new ValidationImpl();
            if (validation.validateData(user)) {
                try {
                    userService.create(user);
                    return true;
                } catch (Exception e) {
                    log.error(e.getMessage());
                    return false;
                }
            }
        }
        return false;
    }
}
