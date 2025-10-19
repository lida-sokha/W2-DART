enum DeliveryType { Delivery, Pickup }

class Product {
  String name;
  double price;

  Product({required this.name, required this.price});
  @override
  String toString() {
    return "$name (\$${price.toStringAsFixed(2)})";
  }
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
    this.address,
  });

  double getTotal() {
    double total = 0;
    for (var product in products) {
      total += product.price;
    }
    if (deliveryType == DeliveryType.Delivery) {
      total += 2.0;
    }
    return double.parse(total.toStringAsFixed(2));
  }

  @override
  String toString() {
    String orderType = deliveryType == DeliveryType.Delivery
        ? "Delivery to $address"
        : "Pickup in shop";

    return "order #$id ($orderType)\n"
        "Product: ${products.join(',')}\n"
        "Total: ${getTotal().toStringAsFixed(2)}";
  }
}

void main() {
  Product p1 = Product(name: "Iphone", price: 1500);
  Product p2 = Product(name: "Mac", price: 2400);
  Product p3 = Product(name: "Laptop", price: 500);

  Order order1 = Order(
    id: 1,
    products: [p1, p2],
    deliveryType: DeliveryType.Delivery,
    address: "123 street, Phom Penh",
  );

  Order order2 = Order(
    id: 2,
    products: [p3],
    deliveryType: DeliveryType.Pickup,
  );
  // Print order details
  print(order1);
  print("--------------");
  print(order2);
}
