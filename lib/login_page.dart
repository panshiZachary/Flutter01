import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'simple login',
      home: AppPage(),
    ));

class AppPage extends StatelessWidget {
  GlobalKey<FormState> _globalKey = GlobalKey();

  String _username;
  String _password;

  void _login() {
    var formState = _globalKey.currentState;
    if (formState.validate()) {
      formState.save();
      print('username：$_username--------- password:$_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple login'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Form(
              key: _globalKey,
              child: Center(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '请输入用户登录名',
                        hintText: '请输入用户登录名',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (val) {
                        _username = val;
                      },
                      onFieldSubmitted: (val) {},
                      validator: (val) {
                        if (val.length == 0) return '用户名长度不能为0';
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '请输入登录密码',
                        hintText: '请输入登录密码',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (val) {
                        _password = val;
                      },
                      onFieldSubmitted: (val) {},
                      validator: (val) {
                        if (val.length < 6) return '密码不能小于6 位';
                        if (val.length > 16) return '密码不能大于16 位';
                        else return null;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: SizedBox(
                        width: 400.0,
                        height: 45.0,
                        child: RaisedButton(
                          onPressed: _login,
                          child: Text(
                            '登录',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
