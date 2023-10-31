import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart';
import '../widgets/order_item.dart' as ci;
import '../widgets/app_drawer.dart';
class OrderScreen extends StatelessWidget {
  static const routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: const Drawers(),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (context, index) => ci.OrderItem(ordersData.orders[index]),
      ),
    );
  }
}