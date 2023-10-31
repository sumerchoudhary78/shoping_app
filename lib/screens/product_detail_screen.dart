import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/productsP.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;

  // ProductDetailScreen(this.title);

  static const routeName = '/Product-Detail-Screen';

  @override
  Widget build(BuildContext context) {
    final ProductId = ModalRoute.of(context)?.settings.arguments as String;

    final loadedProduct = Provider.of<Products>(context,listen: false).findById(ProductId);
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            height: 300, 
            width: double.infinity,
            child: Image.network(loadedProduct.imageUrl, fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            Text('\$${loadedProduct.price}', style: TextStyle(color: Colors.grey,fontSize: 20),),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('${loadedProduct.description}'),
            )
          ],
        ),
      ),
    );
  }
}