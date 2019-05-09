import 'package:flutter/material.dart';

class Products extends StatelessWidget{

  final List<Map<String, dynamic>> products;


  Products(this.products);

  @override
  Widget build(BuildContext context) {
    return products.length > 0 ? ListView.builder(
      itemBuilder: _buildProductItem,
      itemCount: products.length ,
    ) : Center(child: Text('No products found, please add some'));
  }

  Widget _buildProductItem(BuildContext context, int  index){
    return  Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          //SizedBox(height: 10.0,),
          Container(
            //margin: EdgeInsets.all(10.0),
            //margin: EdgeInsets.only(top: 10.0),
            //margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.only(top: 10.0),
            child:  Text(
              products[index]['tittle'] ,
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oswald'

              ),
            ),
          ),
          /*Padding(
            padding: EdgeInsets.only(top: 10.0),
            child:  Text(products[index]['tittle']),
          ),*/
          ButtonBar(
            alignment: MainAxisAlignment.center ,
            children: <Widget>[
              FlatButton(
                child:
                  Text('Details'),
                  onPressed: ()=> Navigator
                                  .pushNamed<bool>(context, '/product/' +index.toString())

              )
            ],
          )
        ],
      ),
    );
  }
}