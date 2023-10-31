import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/productsP.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/Edit-Product-Screen';
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _pricefocusNode = FocusNode();
  final _descriptionfocusNode = FocusNode();
  final _imageController = TextEditingController();
  final _imageFocusNode = FocusNode();
  final _globalKey =  GlobalKey<FormState> ();
  
  var  _editProduct = Product(
    id: null, 
    title: '', 
    description:'', 
    price: 0, 
    imageUrl: '');

  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };
  var _isInit = true;


  @override
  void initState() {
    _imageFocusNode.addListener(_updateUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)?.settings.arguments;
      if (productId != null) {
        _editProduct =
            Provider.of<Products>(context, listen: false).findById(productId.toString());
        _initValues = {
          'title': _editProduct.title,
          'description': _editProduct.description,
          'price': _editProduct.price.toString(),
          'imageUrl': '',
        };
        _imageController.text = _editProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  
  @override
  void dispose() {
    _imageFocusNode.removeListener(_updateUrl);
    _descriptionfocusNode.dispose();
    _pricefocusNode.dispose();
    _imageController.dispose();
    _imageFocusNode.dispose();
    super.dispose();
  }
  
  void _updateUrl(){
    if (!_imageFocusNode.hasFocus) {
      if ((!_imageController.text.startsWith('http') &&
              !_imageController.text.startsWith('https')) ||
          (!_imageController.text.endsWith('.png') &&
              !_imageController.text.endsWith('.jpg') &&
              !_imageController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _saveFrom(){
    final currentState = _globalKey.currentState;
    if (currentState == null) {
      return;
    }
    final isValid = currentState.validate();
    if (!isValid) {
      return;
    }
    currentState.save();
    if (_editProduct.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editProduct.id as String, _editProduct);
    } else {
      Provider.of<Products>(context, listen: false).addProducts(_editProduct);
    }
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Your Products'),
        actions: [
          IconButton(onPressed: _saveFrom, icon: const Icon(Icons.save)),
        ],
      ),
      body: Form(child: ListView(
        key: _globalKey,
        children: [
          TextFormField(
            decoration: const InputDecoration(label: Text(' Title')),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_pricefocusNode);
            },
            validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
            onSaved: (newValue) {
              _editProduct = Product(
              id: _editProduct.id, 
              title: newValue!, 
              description: _editProduct.description, 
              price: _editProduct.price, 
              imageUrl: _editProduct.imageUrl);
            },
          ),
          
          TextFormField(
            decoration: const InputDecoration(label: Text(' Price')),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            focusNode: _pricefocusNode,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_descriptionfocusNode);
            },
            validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a price.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  return null;
                },
            onSaved: (newValue) {
              _editProduct = Product(
              id: _editProduct.id, 
              title: _editProduct.title, 
              description: _editProduct.description, 
              price: double.parse(newValue!), 
              imageUrl: _editProduct.imageUrl);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(label: Text('Discription')),
            maxLines: 4,
            keyboardType: TextInputType.multiline,
            focusNode: _descriptionfocusNode,
            validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description.';
                  }
                  if (value.length < 10) {
                    return 'Should be at least 10 characters long.';
                  }
                  return null;
                },
            onSaved: (newValue) {
              _editProduct = Product(
              id: _editProduct.id, 
              title: _editProduct.title, 
              description: newValue!, 
              price: _editProduct.price, 
              imageUrl: _editProduct.imageUrl);
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(
                  top: 8,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.blue[300] as Color,
                  ),
                ),
                child: _imageController.text.isEmpty ? const  Text('Image Url') : FittedBox(child: Image.network(_imageController.text),fit: BoxFit.cover,),
              ),
              Expanded(
                child: TextFormField(
                  decoration: const  InputDecoration(label: Text('Image Url')),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.done,
                  controller: _imageController,
                  focusNode: _imageFocusNode,
                  onFieldSubmitted: (_) {
                        _saveFrom();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an image URL.';
                        }
                        if (!value.startsWith('http') &&
                            !value.startsWith('https')) {
                          return 'Please enter a valid URL.';
                        }
                        if (!value.endsWith('.png') &&
                            !value.endsWith('.jpg') &&
                            !value.endsWith('.jpeg')) {
                          return 'Please enter a valid image URL.';
                        }
                        return null;
                      },
                  onSaved: (newValue) {
              _editProduct = Product(
              id: _editProduct.id, 
              title: _editProduct.title, 
              description: _editProduct.description, 
              price: _editProduct.price, 
              imageUrl: newValue!);
              
            },
                ),
              )
            ],
          )
        ],
      )
      ),
    );
  }
}