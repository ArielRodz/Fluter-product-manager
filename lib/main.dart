import 'package:flutter/material.dart';
import './product_manager.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Essy List'),
          ),
          body: ProductManager('Food tester'),
      ),
    );
  }

}

