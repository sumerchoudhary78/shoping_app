
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id,this.title,this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,listen: false);
    final cartm = Provider.of<Cart> (context, listen: false);
    return 
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GridTile(
          footer: GridTileBar(
            leading: Consumer<Product>(
              builder: (context, value, child) => 
              IconButton(icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ), 
                onPressed: (){
                  product.toggleFaveroite();
              },color: Theme.of(context).colorScheme.secondary),
            ),
            backgroundColor: Colors.black87,
            title: Text(product.title,textAlign: TextAlign.center,),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart), 
              onPressed: () {cartm.addItem(product.id as String,product.price,product.title);
               ScaffoldMessenger.of(context).hideCurrentSnackBar();
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content:const  Text('Item added ! '),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(label: 'UNDO', onPressed: () {
                    cartm.removeSingleItem(product.id as String);
                  }),
                )
               );
              } ,
              color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: product.id);
              },
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                ),
          ),
        ),
      );

  }
}