import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../providers/cart.dart';


class CartItem extends StatelessWidget {
  @override
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quntity;
  CartItem(this.id, this.productId, this.title, this.price, this.quntity);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 10),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 36,
        ), 
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text(
                  'Do you want to remove the item from the cart?',
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                  ),
                  TextButton(
                    child: Text('Yes'),
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                    },
                  ),
                ],
              ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      } ,
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: ListTile(
          leading: 
             CircleAvatar(
              child: FittedBox(child: Text('\$$price')),
            ),
          title: Text(title),
          subtitle: Text('Total : \$${(price * quntity)}'),
          trailing: Text('$quntity x'),
        ),
      ),
    );
  }
}