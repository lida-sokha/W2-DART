enum DeliveryType { Delivery, Pickup }

class Product {
  String name;
  double price;

  Product({required this.name, required this.price});
}

class Order {
  int id;
  List<Product> products;
  DeliveryType deliveryType;
  String? address;

  Order({
    required this.id,
    required this.products,
    required this.deliveryType,
    required this.address,
  });
}
