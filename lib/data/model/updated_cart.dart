class UpdatedCart {
  UpdatedCart({
    required this.message,
    required this.cart,
    required this.subTotal,
  });
  late final String message;
  late final Cart cart;
  late final double subTotal;

  UpdatedCart.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    cart = Cart.fromJson(json['cart']);
    subTotal = double.parse(json['subTotal'].toString());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['cart'] = cart.toJson();
    _data['subTotal'] = subTotal;
    return _data;
  }
}

class Cart {
  Cart({
    required this.id,
    required this.customerId,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String customerId;
  late final List<Products> products;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    customerId = json['customerId'];
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['customerId'] = customerId;
    _data['products'] = products.map((e) => e.toJson()).toList();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}

class Products {
  Products({
    required this.productId,
    required this.quantity,
  });
  late final ProductId productId;
  late final int quantity;

  Products.fromJson(Map<String, dynamic> json) {
    productId = ProductId.fromJson(json['productId']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['productId'] = productId.toJson();
    _data['quantity'] = quantity;
    return _data;
  }
}

class ProductId {
  ProductId({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.description,
    required this.category,
    required this.attributes,
    required this.tags,
    required this.images,
    required this.relatedProducts,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String name;
  late final Price price;
  late final int quantity;
  late final String description;
  late final String category;
  late final List<String> attributes;
  late final List<String> tags;
  late final List<String> images;
  late final List<dynamic> relatedProducts;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  ProductId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    price = Price.fromJson(json['price']);
    quantity = json['quantity'];
    description = json['description'];
    category = json['category'];
    attributes = List.castFrom<dynamic, String>(json['attributes']);
    tags = List.castFrom<dynamic, String>(json['tags']);
    images = List.castFrom<dynamic, String>(json['images']);
    relatedProducts = List.castFrom<dynamic, dynamic>(json['relatedProducts']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['price'] = price.toJson();
    _data['quantity'] = quantity;
    _data['description'] = description;
    _data['category'] = category;
    _data['attributes'] = attributes;
    _data['tags'] = tags;
    _data['images'] = images;
    _data['relatedProducts'] = relatedProducts;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}

class Price {
  Price({
    required this.$numberDecimal,
  });
  late final String $numberDecimal;

  Price.fromJson(Map<String, dynamic> json) {
    $numberDecimal = json['\$numberDecimal'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['\$numberDecimal'] = $numberDecimal;
    return _data;
  }
}
