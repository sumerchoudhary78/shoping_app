import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import './providers/order.dart';
import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/productsP.dart';
import './providers/cart.dart';
import './screens/order_screen.dart';
import './screens/user_product_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/about_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
          ChangeNotifierProvider(
          create: (ctx) => Products(),
        ) ,
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Order(),
          )
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          fontFamily: 'Roboto', colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.amber[400])
        ),
        home:  ProjectOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName : (ctx) => ProductDetailScreen(),
          CartScreen.routeName :(ctx) => CartScreen(),
          OrderScreen.routeName :(ctx) => OrderScreen(),
          UserProductScreen.routeName :(ctx) => UserProductScreen(),
          EditProductScreen.routeName : (ctx) => const EditProductScreen(),
          AboutDev.routeName : (ctx) =>  AboutDev(),
        },
      ),
    );
  }
}

