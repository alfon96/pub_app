class CartItem {
  String id;
  double price;
  int quantity;
  CartItem({
    required this.id,
    required this.price,
    required this.quantity,
  });

  CartItem copyWith({
    String? id,
    double? price,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartData {
  // The idea is to have a structure like:
  // items : list of products info
  // ids : list of the product ids, so its less work to check if there are or not some items
  // totalPrice : conveys total price

  List<CartItem> items;
  List<String> ids;
  double totalPrice;

  CartData({
    required this.items,
    required this.totalPrice,
    required this.ids,
  });
}
