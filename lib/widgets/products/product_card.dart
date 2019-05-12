import 'package:first_app/widgets/products/price_tag.dart';
import 'package:first_app/widgets/ui_elements/title_default.dart';
import 'package:flutter/material.dart';

import 'address_tag.dart';

class ProductCard extends StatelessWidget{

  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);


  Widget _buildTitlePriceRow(){

    return Container(
      //margin: EdgeInsets.all(10.0),
      //margin: EdgeInsets.only(top: 10.0),
      //margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.only(top: 10.0),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleDefault(product['title']),
            SizedBox(width: 8.0,),
            PriceTag(product['price'].toString()),


          ],)
    );

  }

  Widget _buildActionButtons(BuildContext context){
    return ButtonBar(
      alignment: MainAxisAlignment.center ,
      children: <Widget>[
        IconButton(
            icon:Icon(Icons.info),
            color: Theme.of(context).accentColor,
            onPressed: ()=> Navigator.pushNamed<bool>(context, '/product/' +productIndex.toString())

        ),
        IconButton(
            icon:Icon(Icons.favorite_border),
            color: Colors.red,
            onPressed: ()=>
            {

            }

        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          _buildTitlePriceRow(),
          AddressTag('Union Square, San Francisco'),
          _buildActionButtons(context),
        ],
      ),
    );
  }


}