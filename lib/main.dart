import 'package:first_app/pages/auth.dart';
import 'package:first_app/pages/product.dart';
import 'package:first_app/pages/product_admin.dart';
import 'package:first_app/pages/products.dart';
import 'package:first_app/scoped-models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/product.dart';



void main() {

  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintPointersEnabled = true;
  //debugShowMaterialGrid=  true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }


}
class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return ScopedModel<ProductsModel>(
      model: ProductsModel(),
      child: MaterialApp(
      //debugShowMaterialGrid: true,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          buttonColor: Colors.deepPurple

      ),
      routes: {
        '/': (BuildContext context) =>  AuthPage(),
        '/home': (BuildContext context) =>   ProductsPage() ,
        '/admin': (BuildContext context) => ProductAdminPage(),
      },
      onGenerateRoute: (RouteSettings settings){
        final List<String> pathElements = settings.name.split('/');

        if(pathElements[0] != ''){
          return null;
        }
        if(pathElements[1] =='product'){
          final int index =  int.parse(pathElements[2]);

          return  MaterialPageRoute<bool>(
              builder: (context) =>  ProductPage(index)
          );
        }

        return null;


      } ,
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(
            builder: (BuildContext context) =>  ProductsPage()
        );


      },

    ), );
  }

}

