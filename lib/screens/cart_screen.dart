import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Shopping List')),
      body: cart.shoppingList.isEmpty
          ? Center(child: Text('No items in the shopping list'))
          : ListView.builder(
        itemCount: cart.shoppingList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cart.shoppingList[index]), // Display food name
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                cart.removeFromCart(cart.shoppingList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
