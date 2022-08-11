// List of URL FOR EACH END-POINT
class Configurations {
  // SERVER IP AND PORT NUMBER
  String apiHost = "192.168.85.125:3000";
  // "192.168.149.52"
  // "192.168.249.171"
  // "192.168.85.125"

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

  getCustomerCartURL() => "http://" + apiHost + "/api/shopping-cart/view-cart";

  getCustomerCartRemoveURL() =>
      "http://" + apiHost + "/api/shopping-cart/remove-item-from-cart";

  getCartQuantityUpdateURL() =>
      "http://" + apiHost + "/api/shopping-cart/edit-item-quantity-in-cart";

  // Stripe payment required Strings
  getStripePublicKey() =>
      "pk_test_51LQdcMIBU3FsdwliG9DfW1VrwFf6fg9o6pbwv6AMYG3QtagJW7b6eUw0iIg7Q5AbebNMNLJeF2VEU27qRng1Lo2T00Ljds3wuY";

  getPaymentURL() =>
      "http://" + apiHost + "/api/payment/create-payment-intent-flutter";

  getPaymentIntentURL() => "http://" + apiHost + "/api/payment/test";
}
