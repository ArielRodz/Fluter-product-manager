import 'package:flutter/material.dart';
import 'dart:async';


class ProductPage extends StatelessWidget{
  final String tittle;
  final String imageUrl;

  ProductPage({this.tittle, this.imageUrl});

  _showWarningDialog(BuildContext context){
    showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text('Are you sure?'),
        content: Text('This acction cannot be undone!'),
        actions: <Widget>[
          FlatButton(child: Text('DISCARD'),onPressed: (){
            Navigator.pop(context);

          },),
          FlatButton(child: Text('CONTINUE'),onPressed: (){
            Navigator.pop(context);
            Navigator.pop(context, true);


          })
        ],);

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(onWillPop: (){

      Navigator.pop(context, false);
      return Future.value(false);

    },child: Scaffold(
      appBar: AppBar(
        title: Text(tittle),
      ),
      //body: ProductManager(startingProduct: 'food tester'),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        <Widget>[
          Image.asset(imageUrl),
          Container(padding: EdgeInsets.all(10.0),child: Text('Details!')),
          Container(padding: EdgeInsets.all(10.0),child:
          RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text('DELETE'),
            onPressed: ()=>  _showWarningDialog(context)
          )
          )
        ],
      ),

    ),);
  }


}

