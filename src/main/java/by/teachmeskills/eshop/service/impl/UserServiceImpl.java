package by.teachmeskills.eshop.service.impl;

import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.interfacefolder.UserRepository;
import by.teachmeskills.eshop.service.interfacefolder.UserService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public void create(User entity) throws ServiceException {
        userRepository.save(entity);
    }

    @Override
    public Optional<User> read(int id) throws ServiceException {
        return userRepository.findById(id);
    }

    @Override
    public void update(User entity) throws ServiceException {
        userRepository.save(entity);
    }

    @Override
    public void delete(User entity) throws ServiceException {
        userRepository.delete(entity);
    }

    @Override
    public User getUserByEmail(String email) throws ServiceException {
        return userRepository.findByEmail(email);
    }

    @Override
    public User getUserByEmailAndPass(String email, String pass) throws ServiceException {
        return userRepository.findUserByEmailAndPassword(email, pass);
    }

    @Override
    public List<User> getAllUsers() throws ServiceException {
        return userRepository.findAll();
    }

    @Override
    public List<String> getAllUsersEmail() throws ServiceException {
        return userRepository.findAllUsersEmail();
    }

    @Override
    public List<User> getUsersByEmailLike(String email) throws ServiceException {
        return userRepository.findAllByEmailLike(email);
    }
}
