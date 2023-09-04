import 'package:get/get.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  List<CartItem> cartItems = <CartItem>[];

  void addToCart(Fruits item, int itemCount) {
    final existingItemIndex = cartItems.indexWhere(
          (cartItem) => cartItem.item == item,
    );

    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].quantity += itemCount;
    } else {
      cartItems.add(CartItem(item: item, quantity: itemCount));
    }
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
  }

  int getItemCount(Fruits item) {
    final cartItem = cartItems.firstWhere(
          (cartItem) => cartItem.item == item,
      orElse: () => CartItem(item: item, quantity: 0),
    );

    return cartItem.quantity;
  }

  List<Fruits> getUniqueCartItems() {
    return cartItems.map((cartItem) => cartItem.item).toList();
  }

  double get totalPrice {
    double total = 0;
    for (var cartItem in cartItems) {
      total += (cartItem.item.price ?? 0) * cartItem.quantity;
    }
    return total;
  }

  void clearCart() {
    cartItems.clear();
  }
}

class CartItem {
  final Fruits item;
  int quantity;

  CartItem({required this.item, required this.quantity});
}
