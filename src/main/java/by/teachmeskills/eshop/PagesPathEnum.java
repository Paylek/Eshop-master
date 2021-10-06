package by.teachmeskills.eshop;

public enum PagesPathEnum {
    HOME_PAGE("home"),
    SIGN_IN_PAGE("signin"),
    PRODUCT_PAGE("product"),
    CART_PAGE("cart"),
    SINGLE_PRODUCT_PAGE("productSingle"),
    REGISTRATION_PAGE("registration"),
    CONFIRM_PAGE("confirm"),
    USER_ACCOUNT("userAccount"),
    SEARCH_PAGE("search");

    private final String path;

    PagesPathEnum(String path) {
        this.path = path;
    }

    public String getPath() {
        return path;
    }
}
