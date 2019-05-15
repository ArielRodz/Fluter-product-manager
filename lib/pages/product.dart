import 'package:first_app/models/product.dart';
import 'package:first_app/scoped-models/products.dart';
import 'package:first_app/widgets/ui_elements/title_default.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:scoped_model/scoped_model.dart';

class ProductPage extends StatelessWidget{


  final int productIndex;
  ProductPage(this.productIndex);


  Widget _buildAddressPriceRow(double price)
  {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Union Square, San Francisco',
          style: TextStyle(
              fontFamily: 'Oswald',
              color: Colors.grey),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text('|', style: TextStyle(color: Colors.grey),),

        ),
        Text('\$'+price.toString(),style: TextStyle(fontFamily: 'Oswald',color: Colors.grey))
      ],);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return

      WillPopScope(onWillPop: (){

        Navigator.pop(context, false);
        return Future.value(false);
        },
        child: ScopedModelDescendant<ProductsModel>(builder: (BuildContext context, Widget child, ProductsModel model){

          final List<Product> products = model.displayedProducts;

          return Scaffold(
              appBar: AppBar(
                title: Text(products[productIndex].title),
              ),
              //body: ProductManager(startingProduct: 'food tester'),
              body:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                <Widget>[
                  Image.asset(products[productIndex].image),

                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: TitleDefault(products[productIndex].title),
                  ),
                  _buildAddressPriceRow(products[productIndex].price),
                  Container(
                    padding: EdgeInsets.all(10.0),

                    child:  Text(products[productIndex].description, textAlign: TextAlign.center,),
                  )

                ],
              ),

            );

        } ) ,




    );
  }


}

