package by.teachmeskills.eshop.service.interfacefolder;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.domain.User;

public interface HomePageService {
    User switchUserNameAccount(User user) throws ServiceException;
}
