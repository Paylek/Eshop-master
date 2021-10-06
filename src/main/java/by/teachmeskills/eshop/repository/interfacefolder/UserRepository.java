package by.teachmeskills.eshop.repository.interfacefolder;

import by.teachmeskills.eshop.repository.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByEmail(String email);

    @Override
    List<User> findAll();

    User findUserByEmailAndPassword(String email, String password);

    @Query("select u.email from User u")
    List<String> findAllUsersEmail();

    List<User> findAllByEmailLike(String email);

}
