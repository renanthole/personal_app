import 'package:flutter/material.dart';

void esqueciSenha () => runApp(EsqueciSenha());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class EsqueciSenha extends StatefulWidget {
  @override
  _EsqueciSenhaState createState() => _EsqueciSenhaState();
}

enum FormType { login, register }

class _EsqueciSenhaState extends State<EsqueciSenha> {
  final TextEditingController _emailFilter = new TextEditingController();
  String _email = "";
  FormType _form = FormType.login;

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Container(
            width: 300.0,
            height: 450.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                _logo(),
                _buildTextFields(),
                _buildButtons(),
              ],
            ),
          ),
        ));
  }
    Widget _logo() {
    return Image(
      image: AssetImage('./asset/logo.png'),
      width: 200.0,
      height: 200.0,
    );
  }

  Widget _buildTextFields() {
    return Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            InkWell(
              child: new Container(
                height: 50.0,
                decoration: new BoxDecoration(
                  color: Colors.yellow,
                  border: new Border.all(color: Colors.white, width: 2.0),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: new Center(
                  child: new Text(
                    'Enviar',
                    style: new TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
              onTap: (){
                
              },
            ),
            FlatButton(
              child: new Text('Cancelar'),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    }
  }
}