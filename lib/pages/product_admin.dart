import 'package:flutter/material.dart';
import './product_edit.dart';
import './product_list.dart';



class ProductAdminPage extends StatelessWidget{


  Widget _buildSlideDrawer(BuildContext context){
    return Drawer(child: Column(children: <Widget>[
      AppBar(
        automaticallyImplyLeading: false,
        title: Text('Choose'),),
      ListTile(
        leading: Icon(Icons.shop),
        title: Text('All Products'),
        onTap: (){

          Navigator.pushReplacementNamed(context, '/home');
        },)

    ],),);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSlideDrawer(context),
        appBar: AppBar(
          title: Text('Manage Products'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
                icon: Icon(Icons.create),
                text: 'Create Product' ),
            Tab(
                icon: Icon(Icons.list),
                text: 'My products'),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          ProductEditPage(),
          ProductListPage()
        ]),
    ),);
  }

}