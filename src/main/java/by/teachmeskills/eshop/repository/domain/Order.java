package by.teachmeskills.eshop.repository.domain;


import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "orders")
public class Order extends BaseEntity {

    private LocalDate date;
    private int price;
    private User user;
    private List<Product> productsList;

    private Order(Builder builder) {
        this.id = builder.id;
        this.date = builder.date;
        this.price = builder.price;
        this.user = builder.user;
        this.productsList = builder.productsList;
    }

    public Order() {
    }


    @ManyToOne(optional = false, cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id", nullable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Column(name = "date")
    public LocalDate getDate() {
        return date;
    }

    @Column(name = "price")
    public int getPrice() {
        return price;
    }


    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinTable(name = "orders_products", joinColumns = @JoinColumn(name = "order_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id"))
    public List<Product> getProductsList() {
        return productsList;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setProductsList(List<Product> productsList) {
        this.productsList = productsList;
    }

    public void addProduct(Product product) {
        this.getProductsList().add(product);
        product.getOrders().add(this);
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public static final class Builder {
        private int id;
        private LocalDate date;
        private int price;
        private User user;
        private List<Product> productsList;

        private Builder() {
        }

        public Builder withId(int id) {
            this.id = id;
            return this;
        }

        public Builder withDate(LocalDate date) {
            this.date = date;
            return this;
        }

        public Builder withPrice(int price) {
            this.price = price;
            return this;
        }

        public Builder withUser(User user) {
            this.user = user;
            return this;
        }

        public Builder withListOfProducts(List<Product> productList) {
            this.productsList = productList;
            return this;
        }

        public Order build() {
            return new Order(this);
        }
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Order)) return false;
        Order order = (Order) o;
        return getPrice() == order.getPrice() && Objects.equals(getDate(), order.getDate()) && Objects.equals(user, order.user) && Objects.equals(getProductsList(), order.getProductsList());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getDate(), getPrice(), user, getProductsList());
    }

    @Override
    public String toString() {
        return "Order{" +
                "date=" + date +
                ", price=" + price +
                ", user=" + user +
                ", productsList=" + productsList +
                '}';
    }


}
