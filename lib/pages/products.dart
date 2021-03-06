
import 'package:first_app/scoped-models/connected_products.dart';
import 'package:first_app/scoped-models/main.dart';
import 'package:first_app/widgets/products/products.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductsPage extends StatelessWidget{



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

          ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, ProductsModel model)
          {
            return  IconButton(
            icon: Icon(model.displayFavoritesOnly ? Icons.favorite : Icons.favorite_border),
            onPressed: (){
              model.toggleDisplayMode();
            },);
          }),

        ],
      ),
      //body: ProductManager(startingProduct: 'food tester'),
      body:  Products(),
    );
  }

}