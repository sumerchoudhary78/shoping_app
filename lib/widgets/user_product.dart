import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../providers/productsP.dart';
class UserProduct extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProduct(this.id,this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0, // add elevation here
      child: Column(
        children: [
          ListTile(
            key: ValueKey(title),
            title: Text(title),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  Tooltip(
                    message: 'Edit',
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
                      },
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Tooltip(
                    message: 'Delete',
                    child: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        Provider.of<Products>(context, listen: false).deleteProduct(id);
                      },
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
   
  }
}
