import 'package:first_app/pages/product.dart';
import 'package:first_app/pages/product_admin.dart';
import 'package:first_app/pages/products.dart';
import 'package:flutter/material.dart';


main() {

  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }


}
class _MyAppState extends State<MyApp> {

  List<Map<String,String>>_products =[];


  void _addProduct(Map<String, String> product){
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index)
  {
    setState(() {
      _products.removeAt(index);
    });
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowMaterialGrid: true,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,

      ),
     // home: AuthPage(),
      routes: {
        '/': (BuildContext context) =>  ProductsPage(_products, _addProduct, _deleteProduct),
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
              builder: (context) =>  ProductPage(tittle: _products[index]['tittle'],imageUrl: _products[index]['image'])
          );
        }

        return null;


      } ,
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) =>  ProductsPage(_products, _addProduct, _deleteProduct)
        );


      },

    );
  }

}

