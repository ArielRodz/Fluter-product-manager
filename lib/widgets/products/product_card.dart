import 'package:first_app/models/product.dart';
import 'package:first_app/scoped-models/connected_products.dart';
import 'package:first_app/scoped-models/main.dart';
import 'package:first_app/widgets/products/price_tag.dart';
import 'package:first_app/widgets/ui_elements/title_default.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'address_tag.dart';

class ProductCard extends StatelessWidget{

  final Product  product;
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
            TitleDefault(product.title),
            SizedBox(width: 8.0,),
            PriceTag(product.price.toString()),


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
        ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, ProductsModel model ){
            return IconButton(
                icon:Icon( model.displayedProducts[productIndex].isFavorite ? Icons.favorite : Icons.favorite_border),
                color: Colors.red,
                onPressed: ()
                {
                    model.selectProduct(productIndex);
                    model.toggleProductFavoriteStatus();


                }

            );
          },),

      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          _buildTitlePriceRow(),
          AddressTag('Union Square, San Francisco'),
          Text(product.userEmail),
          _buildActionButtons(context),
        ],
      ),
    );
  }


}