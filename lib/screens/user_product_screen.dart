import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import '../widgets/app_drawer.dart';
import '../widgets/user_product.dart';
import '../providers/productsP.dart';
import '../screens/edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/User-Product-Screen';
  

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      drawer:const  Drawers(),
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: (context, index) => UserProduct(productData.items[index].id as String,productData.items[index].title, productData.items[index].imageUrl),
        ),
      ),
    );
  }
}