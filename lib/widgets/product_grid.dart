import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import './product_item.dart';
import '../providers/productsP.dart';

class ProductsGrid extends StatelessWidget {
  final bool showfavos;

  ProductsGrid(this.showfavos);


  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Products>(context);
    final product = showfavos ? providerData.favoItems : providerData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: product.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: product[i],
        child: ProductItem(
          // product[i].id, 
          // product[i].title,
          // product[i].imageUrl
          ),
      ),
      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/2, crossAxisSpacing: 10,mainAxisSpacing: 10,),
    );
  }
}