import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

import '../providers/cart.dart';
import '../widgets/cart_item.dart' as ci;
import '../providers/order.dart';

class CartScreen extends StatelessWidget {

  static const routeName = '/Cart-Screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: mediaQuery.size.height * 0.01, horizontal: mediaQuery.size.width * 0.02),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent[400]!.withOpacity(0.5), // set the background color here
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Card(
                  elevation: 20,
                  margin: EdgeInsets.all(mediaQuery.size.height * 0.015),
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(mediaQuery.size.height * 0.03),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(mediaQuery.size.height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          'Total Count',
                          style: TextStyle(fontSize:( MediaQuery.of(context).size.width * 0.04* mediaQuery.textScaleFactor), fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: (MediaQuery.of(context).size.width * 0.03)),
                        Chip(
                          label: Text(
                            '\$${cart.totalAmount().toStringAsFixed(2)}',
                            style:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width * 0.03* mediaQuery.textScaleFactor,
                            ),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        TextButton(onPressed: (){
                          Provider.of<Order>(context, listen: false).addOrder(cart.item.values.toList(), cart.totalAmount());
                          cart.clear();
                        }, child: const Text('Order Now', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                      ],
                    ),
                  ),
                ),

              ),

            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.item.length ,
                itemBuilder: (ctx, i) => ci.CartItem(
                    cart.item.values.toList()[i].id,
                    cart.item.keys.toList()[i],
                    cart.item.values.toList()[i].title,
                    cart.item.values.toList()[i].price,
                    cart.item.values.toList()[i].quantity
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
