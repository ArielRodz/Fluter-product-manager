import 'package:flutter/material.dart';
import '../product_manager.dart';


class ProductsPage extends StatelessWidget{

  List<Map<String,String>>_products =[];
  final Function addProduct;
  final Function deleteProduct;

  ProductsPage(this._products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: Column(children: <Widget>[
        AppBar(
          automaticallyImplyLeading: false,
          title: Text('Choose'),),
        ListTile(title: Text('Manage Products'),
          onTap: (){
             Navigator.pushReplacementNamed(context, '/admin');
          },)

      ],),),
      appBar: AppBar(
        title: Text('Essy List'),
      ),
      //body: ProductManager(startingProduct: 'food tester'),
      body: ProductManager(_products, addProduct, deleteProduct),
    );
  }

}