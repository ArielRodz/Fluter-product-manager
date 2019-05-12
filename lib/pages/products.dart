import 'package:first_app/widgets/products/products.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget{

  List<Map<String,dynamic>>_products =[];


  ProductsPage(this._products);

  Widget _buildSlideDrawer(BuildContext context){

    return Drawer(child: Column(children: <Widget>[
      AppBar(
        automaticallyImplyLeading: false,
        title: Text('Choose'),),
      ListTile(
        leading: Icon(Icons.edit),
        title: Text('Manage Products'),
        onTap: (){
          Navigator.pushReplacementNamed(context, '/admin');
        },)

    ],),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSlideDrawer(context),
      appBar: AppBar(
        title: Text('Essy List'),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: (){},),
        ],
      ),
      //body: ProductManager(startingProduct: 'food tester'),
      body:  Products(_products),
    );
  }

}