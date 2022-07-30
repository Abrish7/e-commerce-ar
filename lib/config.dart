// List of URL FOR EACH END-POINT
class Configurations {
  // SERVER IP AND PORT NUMBER
  String apiHost = "192.168.149.52:3000";
  // "192.168.149.52"

  signInURL() => "http://" + apiHost + "/api/customer/login";

  signUpURL() => "http://" + apiHost + "/api/customer/signup";

  getProductURL() => "http://" + apiHost + "/api/products/fetch-products";

  getProductCategory() =>
      "http://" + apiHost + "/api/products/fetch-product-category";

  getFilteredProductURL() =>
      "http://" + apiHost + "/api/products/fetch-products-by-category";

  getProductSubCategoryURL() =>
      "http://" + apiHost + "/api/products/fetch-product-subcategory";

  getCartURL() => "http://" + apiHost + "/api/shopping-cart/add-to-cart";

  getCartQuantityUpdateURL() =>
      "http://" + apiHost + "/api/shopping-cart/edit-item-quantity-in-cart";
}
