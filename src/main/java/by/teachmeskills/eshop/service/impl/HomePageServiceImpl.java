package by.teachmeskills.eshop.service.impl;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.service.interfacefolder.HomePageService;
import org.springframework.stereotype.Service;

@Service
public class HomePageServiceImpl implements HomePageService {


    @Override
    public User switchUserNameAccount(User user) throws ServiceException {
        if (user.getName() == null) {
            user.setName("log in");
        }
        return user;
    }
}
