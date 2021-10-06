package by.teachmeskills.eshop;

public enum RequestParamsEnum {

    FIRST("first"),
    SECOND("second"),
    PAGE_NUMBER("pageNum"),
    SIZE_OF_PAGE("size"),
    ALL_PAGES("totalPages"),
    ALL_ELEMENTS("totalElements"),
    ELEMENTS_ON_PAGE("productsPage"),
    CATEGORIES("categories"),
    CATEGORY("category"),
    USER("user"),
    CART("cart"),
    PRODUCT("product"),
    PURCHASES("purchases"),
    REDIRECT_HOME("redirect:/home"),
    REDIRECT_CART("redirect:/cart"),
    REDIRECT_REGISTRATION("redirect:/registration"),
    MODEL("model"),
    WARNING("warning");

    private final String value;

    RequestParamsEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
