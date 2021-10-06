package by.teachmeskills.eshop.model;

import java.time.LocalDate;
import java.util.List;

import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.repository.domain.User;

public class Purchase {
    private int id;
    private User user;
    private List<Product> products;
    private LocalDate date;

    public Purchase(int id, User user, List<Product> products, LocalDate date) {
        this.user = user;
        this.products = products;
        this.date = date;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public User getUser() {
        return user;
    }

    public List<Product> getProducts() {
        return products;
    }

    public LocalDate getDate() {
        return date;
    }
}
