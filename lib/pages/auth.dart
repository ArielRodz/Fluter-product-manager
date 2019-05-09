import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPageState();
  }
}


class _AuthPageState extends State<AuthPage>
{
  String _username ;
  String _password ;
  bool _acceptsTerms = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child:
            ListView(children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Username'),
                onChanged: (String value){
                  setState(() {
                    _username = value;
                  });
                },),

              TextField(

                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (String value){
                  setState(() {
                    _password = value;
                  });
                },),
              SwitchListTile(
                value: _acceptsTerms,
                onChanged: (bool value){
                    setState(() {
                      _acceptsTerms = value;
                    });
                },
                title: Text('Acepts Terms'),),
              SizedBox(height: 10.0,),
              RaisedButton(child:
              Text('LOGIN'),
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),

            ],)
        ,)
    );
  }

}