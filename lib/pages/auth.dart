import 'package:first_app/scoped-models/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPageState();
  }
}


class _AuthPageState extends State<AuthPage>
{
  final Map<String, dynamic> _formData = {
    'email' : null,
    'password': null,
    'acceptTerms' : false

  };
  bool _acceptsTerms = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  DecorationImage _buildBackgroundImage(){
      return DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
          image: AssetImage('assets/background.jpg'));
  }

  Widget _buildEmailTextField()
  {
    return TextFormField(
      decoration: InputDecoration(labelText: 'E-mail', filled: true, fillColor: Colors.white),
      validator: (String value){
        if(value.isEmpty || !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(value)  ){
          return 'Please Enter a e-mail.';
        }
      },
      onSaved: (String value){
        _formData['email'] = value;

      },);
  }

  Widget _buildPasswordTextField()
  {
    return TextFormField(

      decoration: InputDecoration(labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      validator: (String value){
        if(value.isEmpty || value.length < 5 ){
          return 'Password is required and should be 5+ characters long.';
        }
      },
      onSaved: (String value){
        _formData['password'] = value;

      },);
  }

  Widget _buildAcceptSwitch()
  {
    return SwitchListTile(
      value: _formData['acceptTerms'],
      onChanged: (bool value){
        setState(() {
          _formData['acceptTerms'] = value;
        });


      },
      title: Text('Acepts Terms'),);
  }

  void _submitForm(Function login)
  {
    if(!_formKey.currentState.validate() || !_formData['acceptTerms']){
      return;
    }
    _formKey.currentState.save();
    login(_formData['email'],_formData['password']);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
      final double deviceWidth = MediaQuery.of(context).size.width;
      final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth *0.95;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child:
            Center(
              child:
              SingleChildScrollView(
                child: Form(

                  key: _formKey ,
                  child: Container(
                   width: targetWidth,
                    child: Column( children: <Widget>[
                        _buildEmailTextField(),
                        SizedBox(height: 10.9,),
                        _buildPasswordTextField(),
                        _buildAcceptSwitch(),
                        SizedBox(height: 10.0,),
                        ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model){

                          return RaisedButton(
                            textColor: Colors.white,
                            child:
                            Text('LOGIN'),
                            onPressed: ()=> _submitForm(model.login),
                          );
                        }),

                      ],
                    ),
                  ),
                ),
              ),
            )
        ,)
    );
  }

}

