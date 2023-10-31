import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/product_grid.dart';
import '../providers/cart.dart';
import '../widgets/badges.dart';

enum FilterOptions {
  favorite,
  all,
}

class ProjectOverViewScreen extends StatefulWidget {
  static const routeName = '/ProjectOverViewScreen';

  @override
  State<ProjectOverViewScreen> createState() => _ProjectOverViewScreenState();
}

class _ProjectOverViewScreenState extends State<ProjectOverViewScreen> {
  var _showOnlyFavorite = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions svalue)  {
              setState(() {
                if (svalue == FilterOptions.favorite) {
                  _showOnlyFavorite = true;
                } else {
                  _showOnlyFavorite = false;
                }
              });
            },
            icon:const Icon(Icons.more_vert),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: FilterOptions.favorite,
                child:  Text('Favorite'),
              ),
              PopupMenuItem(
                value: FilterOptions.all,
                child: Text('All'),
              )
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badges(
                  childs: ch as Widget,
                  value: cart.itemCount.toString(),
                  color: Colors.black,
                ),
            child: IconButton(
              icon:const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
        ),
        drawer: const Drawers(),
      body: ProductsGrid(_showOnlyFavorite),
    );
  }
}