package by.teachmeskills.eshop.service.interfacefolder;


import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.exceptions.ServiceException;

import java.util.List;

public interface UserService extends BaseService<User> {

    User getUserByEmail(String email) throws ServiceException;

    User getUserByEmailAndPass(String email, String pass) throws ServiceException;

    List<User> getAllUsers() throws ServiceException;

    List<String> getAllUsersEmail() throws ServiceException;

    List<User> getUsersByEmailLike(String email) throws ServiceException;
}
