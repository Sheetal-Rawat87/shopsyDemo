import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/cart_item.dart';
import '../bloc/cart_cubit.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  const CartItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(item.product.image, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(item.product.title),
      subtitle: Text('Qty: ${item.quantity}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          context.read<CartCubit>().removeFromCart(item.product);
        },
      ),
    );
  }
} 