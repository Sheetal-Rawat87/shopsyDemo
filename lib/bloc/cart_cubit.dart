import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

class CartCubit extends Cubit<List<CartItem>> {
  static const String _cartKey = 'cart_items';

  CartCubit() : super([]) {
    _loadCart();
  }

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString(_cartKey);
    if (cartString != null) {
      final List<dynamic> decoded = json.decode(cartString);
      emit(decoded.map((e) => CartItem.fromJson(e)).toList());
    }
  }

  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = json.encode(state.map((e) => e.toJson()).toList());
    await prefs.setString(_cartKey, cartString);
  }

  void addToCart(Product product) {
    final items = List<CartItem>.from(state);
    final index = items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      items[index].quantity++;
    } else {
      items.add(CartItem(product: product));
    }
    emit(items);
    _saveCart();
  }

  void removeFromCart(Product product) {
    final items = List<CartItem>.from(state);
    items.removeWhere((item) => item.product.id == product.id);
    emit(items);
    _saveCart();
  }

  void clearCart() {
    emit([]);
    _saveCart();
  }

  @override
  void emit(List<CartItem> newState) {
    super.emit(newState);
    _saveCart();
  }

  double get totalPrice {
    return state.fold(0, (sum, item) => sum + item.product.price * item.quantity);
  }
} 