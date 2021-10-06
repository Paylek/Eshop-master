
package by.teachmeskills.eshop.model;

import java.util.ArrayList;
import java.util.List;


import by.teachmeskills.eshop.repository.domain.Order;
import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.repository.domain.User;

import by.teachmeskills.eshop.service.interfacefolder.OrderService;
import org.springframework.stereotype.Component;

@Component
public class Cart {
    private List<Product> products;
    private List<Purchase> purchases;
    static int n = 1;

    User user;

    public Cart() {
        this.products = new ArrayList<>();
        this.purchases = new ArrayList<>();
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Purchase> getPurchases() {

        return purchases;
    }

    public void setPurchases(List<Purchase> purchases) {
        this.purchases = purchases;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public void removeProduct(int id) {
        for (Product product : getProducts()) {
            if (product.getId() == id) {
                products.remove(product);
                break;
            }
        }
    }

    public void addProduct(Product product) {
        getProducts().add(product);

    }

    public List<Purchase> findAllPurchases(User user, OrderService orderService) {
        List<Order> orders = null;
        if (getPurchases().size() != 0) {
            getPurchases().clear();
        }
        try {
            orders = orderService.getAllOrdersWithUserDesc(user.getId());

            if (orders != null) {
                n = orders.size();
                for (Order order : orders) {
                    getPurchases().add(new Purchase(n--, user, order.getProductsList(),
                            order.getDate()));
                }
                n = 1;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return getPurchases();
    }

    public String getTotalPrice() {
        double result;
        if (getProducts().size() == 0) {
            result = 0;
        } else {
            result = getProducts().stream().mapToDouble(p -> (double) p.getPrice()).sum();
        }
        return String.format("%.2f", result);
    }

    public double getTotalPriceDouble() {
        double result;
        if (getProducts().size() == 0) {
            result = 0;
        } else {
            result = getProducts().stream().mapToDouble(p -> (double) p.getPrice()).sum();
        }
        return result;
    }


}
