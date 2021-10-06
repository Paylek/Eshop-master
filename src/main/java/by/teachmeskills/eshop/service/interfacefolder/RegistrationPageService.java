package by.teachmeskills.eshop.service.interfacefolder;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.domain.User;

public interface RegistrationPageService {
    Boolean isRegistrateNewUser(User user, String birthday, UserService userService) throws ServiceException;
}
