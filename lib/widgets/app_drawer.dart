

import 'package:flutter/material.dart';
import 'package:shop_app/screens/about_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/user_product_screen.dart';

import '../screens/order_screen.dart';
class Drawers extends StatelessWidget {
  const Drawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Hello'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () => Navigator.of(context).pushReplacementNamed(OrderScreen.routeName),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.manage_search),
            title: const Text('Manage Products'),
            onTap: () => Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('about'),
            onTap: () => Navigator.of(context).pushReplacementNamed(AboutDev.routeName),
          ),
          const Divider(),
        ],
      ),
    );
  }
}