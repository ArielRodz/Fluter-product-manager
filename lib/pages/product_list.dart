import 'package:first_app/models/product.dart';
import 'package:first_app/pages/product_edit.dart';
import 'package:first_app/scoped-models/products.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class ProductListPage extends StatelessWidget{
  



   Widget _buildEditButton(BuildContext context, int index)
   {
     return ScopedModelDescendant<ProductsModel>(builder: (BuildContext context, Widget child , ProductsModel model){
        return IconButton(
            icon: Icon(Icons.edit),
            onPressed:(){
              model.selectProduct(index);

              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return ProductEditPage();
              }));


            }
        );
     });
   }

  @override
  Widget build(BuildContext context) {
     return ScopedModelDescendant<ProductsModel>(builder: (BuildContext context, Widget child, ProductsModel model)
        {

          return Container(
            margin: EdgeInsets.all(5.0),
            child: ListView.builder(
              itemBuilder:
                  (BuildContext context, int index){
                return Dismissible(

                  key: Key(model.displayedProducts[index].title),
                  onDismissed: (DismissDirection direction){
                    if(direction == DismissDirection.endToStart)
                    {
                      model.deleteProduct();

                    }
                    else if( direction == DismissDirection.startToEnd){
                      print("Swipedt start to end");
                    }
                    else
                    {
                      print("another swipe");
                    }

                  },
                  background: Container(color: Colors.red),
                  child: Column(children: <Widget>[
                    ListTile(
                        contentPadding: EdgeInsets.all(5.0),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(model.displayedProducts[index].image),
                        ),
                        title: Text(model.displayedProducts[index].title),
                        subtitle: Text('\$${model.displayedProducts[index].price.toString()}'),
                        trailing: _buildEditButton(context, index)
                    ),
                    Divider()
                  ],),);



              }, itemCount: model.displayedProducts.length,),);
        });
  }


}