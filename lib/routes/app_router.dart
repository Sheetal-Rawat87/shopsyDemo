import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/product_list_screen.dart';
import '../screens/product_detail_screen.dart';
import '../screens/cart_screen.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/splash': (context) => const SplashScreen(),
    '/': (context) => const ProductListScreen(),
    '/details': (context) => const ProductDetailScreen(),
    '/cart': (context) => const CartScreen(),
  };
} 