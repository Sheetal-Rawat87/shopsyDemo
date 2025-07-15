import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';
import '../bloc/cart_cubit.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(product.image, width: 200, height: 200),
            ),
            const SizedBox(height: 24),
            Text(product.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                ...List.generate(5, (index) {
                  return Icon(
                    index < product.rating.round()
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.amber,
                    size: 20,
                  );
                }),
                const SizedBox(width: 8),
                Text(product.rating.toStringAsFixed(1), style: const TextStyle(fontSize: 15, color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 16),
            Text(product.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            Text('Price: \$${product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple)),
            const SizedBox(height: 24),
            BlocBuilder<CartCubit, List<dynamic>>(
              builder: (context, cartItems) {
                final cartItem = cartItems.cast<dynamic>().firstWhere(
                  (item) => item.product.id == product.id,
                  orElse: () => null,
                );
                if (cartItem == null) {
                  return Center(
                    child: SizedBox(
                      width: 220,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          context.read<CartCubit>().addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to cart!')),
                          );
                        },
                        child: const Text('Add to Cart', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.purple, size: 32),
                          onPressed: () {
                            if (cartItem.quantity > 1) {
                              cartItem.quantity--;
                              context.read<CartCubit>().emit(List.from(cartItems));
                            } else {
                              context.read<CartCubit>().removeFromCart(product);
                            }
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            cartItem.quantity.toString(),
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle, color: Colors.purple, size: 32),
                          onPressed: () {
                            cartItem.quantity++;
                            context.read<CartCubit>().emit(List.from(cartItems));
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
} 