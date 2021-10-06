package by.teachmeskills.eshop.repository.domain;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;


@Entity
@Table(name = "users")
public class User extends BaseEntity {

    private String name;
    private String surname;
    private String email;
    private String password;
    private LocalDate dateOfBirthday;
    private int balance;
    private List<Order> orders;

    public User() {
    }

    private User(Builder builder) {
        this.id = builder.id;
        this.name = builder.name;
        this.surname = builder.surname;
        this.email = builder.email;
        this.password = builder.password;
        this.dateOfBirthday = builder.dateOfBirthday;
        this.balance = builder.balance;
        this.orders = builder.orders;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    @Column(name = "surname")
    public String getSurname() {
        return surname;
    }

    @Column(name = "email", unique = true)
    public String getEmail() {
        return email;
    }

    @Column(name = "password", unique = true)
    public String getPassword() {
        return password;
    }

    @Column(name = "date_of_birthday")
    public LocalDate getDateOfBirthday() {
        return dateOfBirthday;
    }

    @Column(name = "balance")
    public int getBalance() {
        return balance;
    }

//    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//    public List<Order> getOrders() {
//        return orders;
//    }
////
//    public void addOrder(Order order){
//        this.getOrders().add(order);
//        order.setUser(this);
//    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setDateOfBirthday(LocalDate dateOfBirthday) {
        this.dateOfBirthday = dateOfBirthday;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public static Builder userBuilder() {
        return new Builder();
    }

    public static final class Builder {
        private int id;
        private String name;
        private String surname;
        private String email;
        private String password;
        private LocalDate dateOfBirthday;
        private int balance;
        private List<Order> orders = new ArrayList<>();

        private Builder() {
        }

        public Builder withId(int id) {
            this.id = id;
            return this;
        }

        public Builder withName(String name) {
            this.name = name;
            return this;
        }

        public Builder withSurname(String surname) {
            this.surname = surname;
            return this;
        }

        public Builder withOrders() {
            this.orders = new ArrayList<>();
            return this;
        }

        public Builder withEmail(String email) {
            this.email = email;
            return this;
        }

        public Builder withPassword(String password) {
            this.password = password;
            return this;
        }

        public Builder withDateOfBirthday(LocalDate dateOfBirthday) {
            this.dateOfBirthday = dateOfBirthday;
            return this;
        }

        public Builder withBalance(int balance) {
            this.balance = balance;
            return this;
        }

        public User build() {
            return new User(this);
        }
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", dateOfBirthday='" + dateOfBirthday + '\'' +
                ", balance=" + balance +
                ", id=" + id +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;
        User user = (User) o;
        return getBalance() == user.getBalance() &&
                getName().equals(user.getName()) &&
                getSurname().equals(user.getSurname()) &&
                getEmail().equals(user.getEmail()) &&
                getPassword().equals(user.getPassword()) &&
                getDateOfBirthday().equals(user.getDateOfBirthday());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getName(), getSurname(), getEmail(), getPassword(), getDateOfBirthday(), getBalance());
    }
}
