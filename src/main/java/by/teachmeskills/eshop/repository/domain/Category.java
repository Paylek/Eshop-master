package by.teachmeskills.eshop.repository.domain;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "categories")
public class Category extends BaseEntity {
    private String name;
    private int rating;
    private String image_path;
    private List<Product> productList;

    private Category(Builder builder) {
        this.id = builder.id;
        this.name = builder.name;
        this.rating = builder.rating;
        this.productList = builder.productList;
        this.image_path = builder.image_path;
    }

    public Category() {
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    @Column(name = "rating")
    public int getRating() {
        return rating;
    }

    @OneToMany(mappedBy = "category", cascade = CascadeType.PERSIST)
    public List<Product> getProductList() {
        return productList;
    }

    @Column(name = "image_path")
    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public static final class Builder {
        private int id;
        private String name;
        private int rating;
        private List<Product> productList;
        private String image_path;

        private Builder() {
        }

        public Builder withId(int id) {
            this.id = id;
            return this;
        }

        public Builder withImagePath(String image_path) {
            this.image_path = image_path;
            return this;
        }

        public Builder withName(String name) {
            this.name = name;
            return this;
        }

        public Builder withRating(int rating) {
            this.rating = rating;
            return this;
        }

        public Builder withProductList(List<Product> productList) {
            this.productList = productList;
            return this;
        }

        public Category build() {
            return new Category(this);
        }
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Category)) return false;
        Category category = (Category) o;
        return getRating() == category.getRating() && Objects.equals(getName(), category.getName()) && Objects.equals(getImage_path(), category.getImage_path()) && Objects.equals(getProductList(), category.getProductList());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getName(), getRating(), getImage_path(), getProductList());
    }

    @Override
    public String toString() {
        return "Category{" +
                "name='" + name + '\'' +
                ", rating=" + rating +
                ", image_path='" + image_path + '\'' +
                ", productList=" + productList +
                '}';
    }
}
