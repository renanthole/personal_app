import 'package:flutter/material.dart';
import 'package:projeto_personal/view/esqueci_senha.dart';
import 'package:projeto_personal/view/tela_principal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  FormType _form = FormType.login;

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
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
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
          )
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
                    'Entrar',
                    style: new TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaPrincipal()),
                );
              },
            ),
            FlatButton(
              child: new Text('Esqueceu sua senha?'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EsqueciSenha()),
                );
              },
            )
          ],
        ),
      );
    }
  }

}
