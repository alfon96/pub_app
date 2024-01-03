import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/models/cart.dart';

class CartNotifier extends StateNotifier<CartData> {
  CartNotifier() : super(CartData(items: [], totalPrice: 0.0, ids: []));

  void addItem(CartItem inputItem) {
    List<CartItem> updatedItems = List.from(state.items);
    List<String> updatedIds = List.from(state.ids);
    double totalPrice = 0.0;

    if (updatedIds.contains(inputItem.id)) {
      for (int i = 0; i < updatedItems.length; i++) {
        if (updatedItems[i].id == inputItem.id) {
          updatedItems[i] = updatedItems[i].copyWith(
              quantity: updatedItems[i].quantity + inputItem.quantity);
          break;
        }
      }
    } else {
      updatedItems.add(inputItem);
      updatedIds.add(inputItem.id);
    }

    for (CartItem item in updatedItems) {
      totalPrice += item.quantity * item.price;
    }

    state =
        CartData(items: updatedItems, totalPrice: totalPrice, ids: updatedIds);
  }

  void removeItem(CartItem inputItem) {
    List<CartItem> updatedItems = List.from(state.items);
    List<String> updatedIds = List.from(state.ids);
    double totalPrice = 0.0;

    CartItem? itemToRemove;

    if (updatedIds.contains(inputItem.id)) {
      for (int i = 0; i < updatedItems.length; i++) {
        if (updatedItems[i].id == inputItem.id) {
          int updatedQuantity = updatedItems[i].quantity - inputItem.quantity;
          if (updatedQuantity > 0) {
            updatedItems[i] =
                updatedItems[i].copyWith(quantity: updatedQuantity);
          } else {
            itemToRemove = updatedItems[i];
          }
          break;
        }
      }

      if (itemToRemove != null) {
        updatedItems.remove(itemToRemove);
        updatedIds.remove(itemToRemove.id);
      }

      for (CartItem item in updatedItems) {
        totalPrice += item.quantity * item.price;
      }

      state = CartData(
          items: updatedItems, totalPrice: totalPrice, ids: updatedIds);
    }
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, CartData>((ref) => CartNotifier());
